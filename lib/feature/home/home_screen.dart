import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_app/app/common/app_assets.dart';
import 'package:real_estate_app/app/common/app_colors.dart';
import 'package:real_estate_app/app/common/app_typography.dart';
import 'package:real_estate_app/feature/home/widgets/apartment_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                stops: const [0.5, 1.0],
                colors: [Colors.white, orange.withOpacity(0.5)])),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.locationIcon,
                          scale: 30,
                          color: orange50,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Saint Petersburg',
                          style:
                              AppTypography.bodySmall.copyWith(color: orange50),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: CircleAvatar(
                            child: Image.asset(AppAssets.userAvarta),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Hi, Marina',
                      style: AppTypography.headlineSmall.copyWith(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: orange50),
                    ),
                    Text(
                      'let\'s select your \nperfect place',
                      style: AppTypography.headlineMedium.copyWith(
                          fontSize: 32.0,
                          fontWeight: FontWeight.normal,
                          height: 1.2,
                          color: black),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 175.0,
                          width: 175.0,
                          padding: const EdgeInsets.all(20.0),
                          decoration: const BoxDecoration(
                              color: orange, shape: BoxShape.circle),
                          child: Column(
                            children: [
                              Text(
                                'BUY',
                                style: AppTypography.bodySmall
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                '1034',
                                style: AppTypography.headlineMedium
                                    .copyWith(color: Colors.white, height: 1.0),
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                'offers',
                                style: AppTypography.bodySmall.copyWith(
                                    color: Colors.white, fontSize: 11.0),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 175.0,
                          width: 175.0,
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18.0)),
                          child: Column(
                            children: [
                              Text(
                                'RENT',
                                style: AppTypography.bodySmall
                                    .copyWith(color: orange50),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                '2212',
                                style: AppTypography.headlineMedium
                                    .copyWith(color: orange50, height: 1.0),
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                'offers',
                                style: AppTypography.bodySmall
                                    .copyWith(color: orange50, fontSize: 11.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: Column(
                  children: [
                    Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      )),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                AppAssets.apartmentOne,
                                fit: BoxFit.cover,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Spacer(),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 5.0, sigmaY: 5.0),
                                    child: Container(
                                      height: 50.0,
                                      width: double.infinity,
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Spacer(),
                                          const SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            'Gladcova St, 25',
                                            style: AppTypography.bodySmall,
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 45.0,
                                            width: 45.0,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
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
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ApartmentCard(
                            height: 350.0,
                            address: 'Gubina St, 11',
                            imageUrl: AppAssets.apartmentTwo,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              ApartmentCard(
                                height: 170.0,
                                address: 'Trefoleva St, 43',
                                imageUrl: AppAssets.apartmentThree,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              ApartmentCard(
                                height: 170.0,
                                address: 'Sedova St, 22',
                                imageUrl: AppAssets.apartmentFour,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


