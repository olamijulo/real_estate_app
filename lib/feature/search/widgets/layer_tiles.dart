import 'package:flutter/material.dart';
import 'package:real_estate_app/app/common/app_colors.dart';

class LayerTiles extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String iconPath;
  const LayerTiles(
      {super.key,
      required this.onTap,
      required this.title,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            iconPath,
            color: grey50,
            scale: 30.0,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            title,
            style: const TextStyle(color: grey50, fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
