import 'package:flutter/material.dart';
import 'package:greentick_assesment/models/productData.dart';
import 'package:greentick_assesment/utils/colors.dart';
import 'package:greentick_assesment/utils/fontStyle.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.productData,
    Key? key,
  }) : super(key: key);

  final ProductModel productData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 4,
            padding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Welcome to ${productData.title}")),
            );
          },
          child: ProductImage(productData: productData),
        ),
        const SizedBox(height: 15),
        Text(
          productData.title,
          style: aTitleText,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            LikeCount(count: productData.likeCount, isLike: true),
            const SizedBox(width: 10),
            LikeCount(count: productData.dislikeCount, isLike: false),
            const SizedBox(width: 10),
            Ratings(rating: productData.rating)
          ],
        )
      ],
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.productData,
  }) : super(key: key);

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Image.network(
        productData.image,
        height: 150,
        width: 250,
        fit: BoxFit.cover,
        errorBuilder: (_, child, loading) => SizedBox(
          height: 160,
          width: 240,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.error,
              ),
              Text(
                "Could not load url",
              )
            ],
          ),
        ),
        loadingBuilder: (_, child, progress) => progress == null
            ? child
            : SizedBox(
                height: 160,
                width: 240,
                child: Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      value: progress.cumulativeBytesLoaded /
                          progress.expectedTotalBytes!,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class LikeCount extends StatelessWidget {
  const LikeCount({
    required this.count,
    required this.isLike,
    Key? key,
  }) : super(key: key);

  final int count;
  final bool isLike;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isLike ? Icons.thumb_up : Icons.thumb_down,
          color: isLike ? aGreenColor : aRedColor,
          size: 15,
        ),
        const SizedBox(width: 3),
        Text(
          count.toString(),
          style: aInfoText,
        )
      ],
    );
  }
}

class Ratings extends StatelessWidget {
  const Ratings({
    this.rating,
    Key? key,
  }) : super(key: key);
  final double? rating;

  @override
  Widget build(BuildContext context) {
    Color _color = rating != null ? aGreenColor : Colors.grey;
    Icon _icon = Icon(rating != null ? Icons.star : Icons.star_outline,
        color: _color, size: 15);
    Icon _myicon = Icon(rating != null ? Icons.star : Icons.star_outline,
        color: _color, size: 15);
    return Row(
      children: [
        _icon,
        _icon,
        _icon,
        _icon,
        _myicon,
        const SizedBox(width: 4),
        Text(
          rating != null ? rating.toString() : "NA",
          style: aInfoText,
        ),
      ],
    );
  }
}
