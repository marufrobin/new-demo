import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rider/src/core/common/widget/app_loading_skeleton.widget.dart';

import 'app_image_placeholder.widget.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.errorWidget,
  });

  final String imageUrl;

  final double? width;
  final double? height;

  final BoxFit fit;

  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          // Image has loaded, show with a fade-in animations
          return AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            child: child,
          );
        } else {
          // Image is still loading, display a loading indicator
          return AppLoadingSkeletonWidget(
            height: height ?? double.infinity,
            width: width ?? double.infinity,
          );
        }
      },
      errorBuilder: (context, error, stackTrace) {
        log(
          "Error loading image $imageUrl:",
          error: error,
          stackTrace: stackTrace,
        );
        return errorWidget ??
            Center(
              child: AppImagePlaceHolderWidget(
                width: width,
                height: height,
                fit: fit,
              ),
            );
      },
    );
  }
}
