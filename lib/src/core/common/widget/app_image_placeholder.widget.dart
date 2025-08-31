import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/widget/app_assets_image.widget.dart';
import 'package:rider/src/core/constant/image_path.dart';

class AppImagePlaceHolderWidget extends StatelessWidget {
  const AppImagePlaceHolderWidget({
    super.key,
    this.width,
    this.height,
    this.fit,
  });

  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: Container(
        padding: EdgeInsets.all(16.r),
        child: AppAssetImageWidget(
          imagePath: ImagePath.logo,
          width: width,
          height: height,
          fit: fit,
        ),
      ),
    );
  }
}
