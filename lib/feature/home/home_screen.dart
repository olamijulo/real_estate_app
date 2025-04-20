import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_app/app/common/app_assets.dart';
import 'package:real_estate_app/app/common/app_colors.dart';
import 'package:real_estate_app/app/common/app_typography.dart';
import 'package:real_estate_app/feature/home/widgets/apartment_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _easeOutBackAnimation;
  late Animation<double> _fastLinearToSlowEaseInAnimation;
  late Animation<int> _easeOutAnimation;
  late Animation<double> _easeInAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _easeOutAnimation = IntTween(begin: 0, end: 1034).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _easeOutBackAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _easeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _fastLinearToSlowEaseInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );

    _controller.forward();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                stops: const [0.5, 1.0],
                colors: [orange.withOpacity(0.01), orange.withOpacity(0.3)])),
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
                        SizeTransition(
                          sizeFactor: _easeOutBackAnimation,
                          axis: Axis.horizontal,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: FadeTransition(
                              opacity: _easeInAnimation,
                              child: Row(
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
                                    style: AppTypography.bodySmall
                                        .copyWith(color: orange50),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        FadeTransition(
                          opacity: _easeOutBackAnimation,
                          child: ScaleTransition(
                            scale: _easeOutBackAnimation,
                            child: SizedBox(
                              height: 50.0,
                              width: 50.0,
                              child: CircleAvatar(
                                child: Image.asset(AppAssets.userAvarta),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    FadeTransition(
                      opacity: _easeInAnimation,
                      child: Text(
                        'Hi, Marina',
                        style: AppTypography.headlineSmall.copyWith(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: orange50),
                      ),
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 1), // Start below screen
                        end: Offset.zero, // End at original position
                      ).animate(_easeOutBackAnimation),
                      child: Text(
                        'let\'s select your \nperfect place',
                        style: AppTypography.headlineMedium.copyWith(
                            fontSize: 32.0,
                            fontWeight: FontWeight.normal,
                            height: 1.2,
                            color: black),
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeTransition(
                          opacity: _easeOutBackAnimation,
                          child: ScaleTransition(
                            scale: _easeOutBackAnimation,
                            child: Container(
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
                                  AnimatedBuilder(
                                      animation: _easeOutAnimation,
                                      builder: (context, child) {
                                        return Text(
                                          '${_easeOutAnimation.value}',
                                          style: AppTypography.headlineMedium
                                              .copyWith(
                                                  color: Colors.white,
                                                  height: 1.0),
                                        );
                                      }),
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
                          ),
                        ),
                        FadeTransition(
                          opacity: _easeOutBackAnimation,
                          child: ScaleTransition(
                            scale: _easeOutBackAnimation,
                            child: Container(
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
                                  AnimatedBuilder(
                                      animation: _easeOutAnimation,
                                      builder: (context, child) {
                                        return Text(
                                          '${_easeOutAnimation.value}',
                                          style: AppTypography.headlineMedium
                                              .copyWith(
                                                  color: orange50, height: 1.0),
                                        );
                                      }),
                                  const SizedBox(
                                    height: 3.0,
                                  ),
                                  Text(
                                    'offers',
                                    style: AppTypography.bodySmall.copyWith(
                                        color: orange50, fontSize: 11.0),
                                  )
                                ],
                              ),
                            ),
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
              FadeTransition(
                opacity: _fastLinearToSlowEaseInAnimation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(_easeOutBackAnimation),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
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
                                    SizeTransition(
                                      sizeFactor: _easeInAnimation,
                                      axis: Axis.horizontal,
                                      axisAlignment: 1,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 5.0, sigmaY: 5.0),
                                          child: Container(
                                            height: 50.0,
                                            width: double.infinity,
                                            padding: const EdgeInsets.only(
                                                right: 5.0),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Spacer(),
                                                const SizedBox(
                                                  width: 30.0,
                                                ),
                                                Text(
                                                  'Gladcova St, 25',
                                                  style:
                                                      AppTypography.bodySmall,
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
                                                          offset: const Offset(
                                                              0, 4),
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
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
