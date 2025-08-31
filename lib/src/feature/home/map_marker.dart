import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider/src/core/constant/image_path.dart';

class MapMarker extends StatelessWidget {
  const MapMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(ImagePath.mapMarkerIconImage);
  }
}
