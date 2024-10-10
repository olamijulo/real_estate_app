import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_app/app/common/app_colors.dart';
import 'package:real_estate_app/app/common/app_typography.dart';

class ApartmentCard extends StatelessWidget {
  final double? height;
  final String? imageUrl;
  final String? address;
  final VoidCallback? onTap;

  const ApartmentCard(
      {super.key,
      this.height,
      required this.imageUrl,
      required this.address,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      )),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                imageUrl!,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      height: 50.0,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            address ?? '--',
                            style: AppTypography.bodySmall,
                          ),
                          const Spacer(),
                          const Spacer(),
                          Container(
                            height: 45.0,
                            width: 45.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 3,
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ]),
                            child: const Icon(
                              Icons.chevron_right,
                              color: orange50,
                              size: 18.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}