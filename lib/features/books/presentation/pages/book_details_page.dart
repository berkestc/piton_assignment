import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../core/extensions.dart';
import '../../../../utils/svg_icon.dart';
import '../../domain/models/product.dart';
import '../providers/books_provider.dart';

class BookDetails extends StatelessWidget {
  const BookDetails();

  @override
  Widget build(BuildContext context) {
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
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text("Book Details"),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.w, 33.h, 20.w, 40.h),
        child: Stack(
          children: [
            Column(
              children: [
                const _Cover(),
                SizedBox(height: 40.h),
                const _Summary(),
                SizedBox(height: 35.h),
                const _Button(),
              ],
            ),
            const _LikeButton(),
          ],
        ),
      ),
    );
  }
}

class _LikeButton extends ConsumerWidget {
  const _LikeButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksNotifier = ref.watch(booksProvider.notifier);
    final booksState = ref.watch(booksProvider);
    final product = context.arguments as Product;
    final isLiked = booksState.likedProductIds.contains(product.id);

    return Positioned(
      right: 0,
      child: Ink(
        height: 44.r,
        width: 44.r,
        decoration: const BoxDecoration(color: inputDecorationFilledColor, shape: BoxShape.circle),
        child: IconButton(
          onPressed: () => booksNotifier.toggleLike(product.id),
          color: primaryColor,
          splashRadius: 22.r,
          icon: SvgIcon(name: isLiked ? "heart_filled" : "heart"),
        ),
      ),
    );
  }
}

class _Cover extends StatelessWidget {
  const _Cover();

  @override
  Widget build(BuildContext context) {
    final product = context.arguments as Product;

    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: product.imageURL,
          height: 225.h,
          width: 150.w,
        ),
        SizedBox(height: 20.h),
        Text(product.name, style: Theme.of(context).textTheme.headline5),
        SizedBox(height: 10.h),
        Text(product.author, style: Theme.of(context).textTheme.headline6),
      ],
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary();

  @override
  Widget build(BuildContext context) {
    final product = context.arguments as Product;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Summary", style: Theme.of(context).textTheme.headline5),
        SizedBox(height: 10.h),
        Text(product.description, style: Theme.of(context).textTheme.headline6?.copyWith(height: 1.625)),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    final product = context.arguments as Product;

    return ElevatedButton(
      onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${product.price} \$"),
          Text(
            "Buy Now",
            style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
