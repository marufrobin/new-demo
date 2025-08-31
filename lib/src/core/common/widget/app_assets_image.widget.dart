import 'package:flutter/material.dart';
import 'package:rider/src/core/constant/image_path.dart';

class AppAssetImageWidget extends StatelessWidget {
  const AppAssetImageWidget({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  final String? imagePath;

  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath ?? "",
      fit: fit,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) => Image.asset(ImagePath.logo),
    );
  }
}
