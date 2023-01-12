import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:piton_assignment/constants/colors.dart';
import 'package:piton_assignment/custom/custom_text_form_field.dart';
import 'package:piton_assignment/utils/svg_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
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
      body: const CustomScrollView(
        slivers: [
          _Filters(),
          _Search(),
          _BestSeller(),
        ],
      ),
    );
  }
}

class _Filters extends StatelessWidget {
  const _Filters();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 90.h,
        child: ListView.separated(
          padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 20.h),
          separatorBuilder: (context, index) => SizedBox(width: 10.w),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => ChoiceChip(
            label: const Text("asdas"),
            selected: true,
            onSelected: (_) {},
          ),
        ),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 40.h),
      sliver: SliverToBoxAdapter(
        child: CustomTextFormField(
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

class _BestSeller extends StatelessWidget {
  const _BestSeller();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Seller",
                  style: Theme.of(context).textTheme.headline5,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
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
              shrinkWrap: true,
              itemBuilder: (context, index) => const _BookItem(),
              separatorBuilder: (context, indez) => SizedBox(width: 10.w),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}

class _BookItem extends StatelessWidget {
  const _BookItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.w,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: inputDecorationFilledColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Placeholder(
            fallbackWidth: 80.w,
            fallbackHeight: 120.h,
          ),
          SizedBox(width: 10.w),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dune",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 4.h),
                Text(
                  "Frank Herbert",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const Spacer(),
                Text(
                  "87,75 \$",
                  style:
                      Theme.of(context).textTheme.headline6?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
