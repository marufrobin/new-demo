import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_image_placeholder.widget.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageURL,
    this.height,
    this.width,
    this.fit,
  });

  final String imageURL;

  final double? height;
  final double? width;

  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) => AppImagePlaceHolderWidget(
        width: width,
        height: height,
        fit: fit,
      ),
      errorWidget: (context, url, error) => AppImagePlaceHolderWidget(
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
