import 'package:flutter/material.dart';
import 'package:real_estate_app/app/common/app_assets.dart';
import 'package:real_estate_app/app/common/app_colors.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
          color: orange,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0))),
      child: Image.asset(
        AppAssets.hotelIcon,
        color: Colors.white,
        scale: 20.0,
      ),
    );
  }
}
