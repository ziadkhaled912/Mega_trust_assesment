import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageAvatar extends StatelessWidget {
  const CustomImageAvatar({
    Key? key,
    required this.imageUrl,
    required this.size,
    this.hasBorder = false,
    this.borderColor = Colors.black,
  }) : super(key: key);

  final String imageUrl;
  final double size;
  final bool hasBorder;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: hasBorder ? Border.all(color: borderColor, width: 2) : null,
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      // child: DefaultCachedNetworkImage(
      //   imageUrl: imageUrl,
      //   fit: BoxFit.cover,
      //   width: double.infinity,
      // ),
    );
  }
}
