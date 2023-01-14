import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_text_form_field.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/svg_icon.dart';
import '../../domain/models/category.dart';
import '../../domain/models/product.dart';
import '../providers/books_provider.dart';

final _currentCategoryProvider = Provider.autoDispose<Category>((ref) => throw UnimplementedError());
final _currentProductProvider = Provider.autoDispose<Product>((ref) => throw UnimplementedError());

class HomePage extends ConsumerWidget {
  const HomePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksState = ref.watch(booksProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 92.h,
        leadingWidth: 70.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: const SvgIcon(
            name: "app_icon",
            size: Size(50, 32),
            color: primaryColor,
          ),
        ),
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text("Catalog"),
        ),
      ),
      body: booksState.isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : CustomScrollView(
              slivers: [
                const _Filters(),
                const _Search(),
                for (final category in booksState.categories.where(
                  (element) =>
                      element.products
                          .where(
                            (element) =>
                                element.name.toLowerCase().contains(booksState.searchFilter) ||
                                element.author.toLowerCase().contains(booksState.searchFilter),
                          )
                          .isNotEmpty &&
                      booksState.selectedCategoryId.fold(() => true, (a) => element.id == a),
                ))
                  ProviderScope(
                    overrides: [_currentCategoryProvider.overrideWithValue(category)],
                    child: const _Category(),
                  )
              ],
            ),
    );
  }
}

class _Filters extends ConsumerWidget {
  const _Filters();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksNotifier = ref.watch(booksProvider.notifier);
    final booksState = ref.watch(booksProvider);

    final isAllFilterSelected = booksState.selectedCategoryId.fold(() => true, (a) => false);

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 90.h,
        child: ListView.custom(
          padding: EdgeInsets.fromLTRB(20.w, 28.h, 10.w, 20.h),
          scrollDirection: Axis.horizontal,
          childrenDelegate: SliverChildListDelegate.fixed(
            [
              ChoiceChip(
                label: Text(
                  "All",
                  style: Theme.of(context)
                      .chipTheme
                      .labelStyle
                      ?.copyWith(color: !isAllFilterSelected ? textColor.withOpacity(0.4) : null),
                ),
                selected: isAllFilterSelected,
                onSelected: (_) => booksNotifier.setFilter(null),
              ),
              SizedBox(width: 10.w),
              for (final category in booksState.categories.where((element) => element.products.isNotEmpty))
                buildCategoryFilter(context, ref, category: category),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryFilter(BuildContext context, WidgetRef ref, {required Category category}) {
    final booksNotifier = ref.read(booksProvider.notifier);
    final booksState = ref.read(booksProvider);

    final isSelected = booksState.selectedCategoryId.fold(() => false, (a) => a == category.id);

    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: ChoiceChip(
        label: Text(
          category.name,
          style:
              Theme.of(context).chipTheme.labelStyle?.copyWith(color: !isSelected ? textColor.withOpacity(0.4) : null),
        ),
        selected: isSelected,
        onSelected: (_) => booksNotifier.setFilter(category.id),
      ),
    );
  }
}

class _Search extends ConsumerWidget {
  const _Search();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksNotifier = ref.watch(booksProvider.notifier);

    return SliverPadding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 40.h),
      sliver: SliverToBoxAdapter(
        child: CustomTextFormField(
          onChanged: booksNotifier.onSearchFilterChanged,
          onFieldSubmitted: booksNotifier.onSearchFilterChanged,
          hintText: "Search",
          prefixIcon: const SvgIcon(
            name: "search",
            size: Size.fromRadius(8),
          ),
          suffixIcon: const SvgIcon(
            name: "filter",
            size: Size.fromRadius(8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        ),
      ),
    );
  }
}

class _Category extends ConsumerWidget {
  const _Category();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(_currentCategoryProvider);
    final booksState = ref.watch(booksProvider);

    final filtered = category.products.where(
      (element) =>
          element.name.toLowerCase().contains(booksState.searchFilter) ||
          element.author.toLowerCase().contains(booksState.searchFilter),
    );

    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pushNamed(Routes.category, arguments: category),
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: const Size(45, 16),
                    foregroundColor: elevatedButtonColor,
                    textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  child: const Text("View All"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 40.h),
              itemBuilder: (context, index) => ProviderScope(
                overrides: [_currentProductProvider.overrideWithValue(filtered.elementAt(index))],
                child: const _BookItem(),
              ),
              separatorBuilder: (context, indez) => SizedBox(width: 10.w),
              itemCount: filtered.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _BookItem extends ConsumerWidget {
  const _BookItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(_currentProductProvider);

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Routes.bookDetails, arguments: product),
      child: Container(
        width: 210.w,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: inputDecorationFilledColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: product.imageURL,
              height: 120.h,
              width: 80.w,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      product.author,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const Spacer(),
                    Text(
                      "${product.price} \$",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
