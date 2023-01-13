import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:piton_assignment/constants/colors.dart';
import 'package:piton_assignment/core/extensions.dart';
import 'package:piton_assignment/features/books/domain/models/category.dart';
import 'package:piton_assignment/routes/routes.dart';

import '../../../../custom/custom_text_form_field.dart';
import '../../../../utils/svg_icon.dart';
import '../../domain/models/product.dart';

final _currentProductProvider = Provider<Product>((ref) => throw UnimplementedError());

final _searchProvider = StateProvider.autoDispose((ref) => "");

class CategoryPage extends ConsumerWidget {
  const CategoryPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = context.arguments as Category;

    final searchQuery = ref.watch(_searchProvider);

    final filteredProducts = category.products
        .where((element) => element.name.contains(searchQuery) || element.author.contains(searchQuery));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 25,
          onPressed: Navigator.of(context).pop,
          icon: const SvgIcon(
            name: "back_arrow",
            color: textColor,
          ),
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(category.name),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const _Search(),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 40.h),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: filteredProducts.length,
                (context, index) => ProviderScope(
                  overrides: [_currentProductProvider.overrideWithValue(filteredProducts.elementAt(index))],
                  child: const _ProductItem(),
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                mainAxisExtent: 284.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Search extends ConsumerWidget {
  const _Search();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.watch(_searchProvider.notifier);

    return SliverPadding(
      padding: EdgeInsets.fromLTRB(20.w, 33.h, 20.w, 40.h),
      sliver: SliverToBoxAdapter(
        child: CustomTextFormField(
          onChanged: (value) => searchController.state = value,
          onFieldSubmitted: (value) => searchController.state = value,
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

class _ProductItem extends ConsumerWidget {
  const _ProductItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(_currentProductProvider);

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Routes.bookDetails, arguments: product),
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: inputDecorationFilledColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            CachedNetworkImage(imageUrl: product.imageURL),
            SizedBox(width: 10.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        product.author,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 8),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${product.price} \$",
                  style:
                      Theme.of(context).textTheme.bodyText1?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
