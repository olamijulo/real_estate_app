import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:real_estate_app/app/common/app_assets.dart';
import 'package:real_estate_app/app/common/app_colors.dart';
import 'package:real_estate_app/feature/search/widgets/custom_marker.dart';
import 'package:real_estate_app/feature/search/widgets/layer_tiles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  bool islayersVisible = true;

  late Animation<double> _easeInAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _easeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent, 
        onTap: () {
          if (!islayersVisible) return; 
          setState(() {
            islayersVisible = false;
          });
        },
        child: Stack(
          children: [
            FlutterMap(
              options: const MapOptions(
                backgroundColor: black,
                initialCenter: LatLng(6.5244, 3.3792),
                initialZoom: 11.2,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png",
                  subdomains: const ['a', 'b', 'c', 'd'],
                  retinaMode: true,
                ),
                RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      onTap: () =>
                          (Uri.parse('https://openstreetmap.org/copyright')),
                    ),
                  ],
                ),
                MarkerLayer(markers: [
                  Marker(
                    point: const LatLng(6.4534, 3.4510),
                    width: 100.0,
                    height: 40.0,
                    child: CustomMarker(
                      animation: _easeInAnimation,
                      markerLabel: '13,3mn P',
                    ),
                  ),
                  Marker(
                    point: const LatLng(6.4534, 3.4510),
                    width: 100.0,
                    height: 40.0,
                    child: CustomMarker(
                      animation: _easeInAnimation,
                      markerLabel: '11mn P',
                    ),
                  ),
                  Marker(
                    point: const LatLng(6.4170, 3.4707),
                    width: 100.0,
                    height: 40.0,
                    child: CustomMarker(
                      animation: _easeInAnimation,
                      markerLabel: '10,3mn P',
                    ),
                  ),
                  Marker(
                    point: const LatLng(6.4504, 3.4002),
                    width: 100.0,
                    height: 40.0,
                    child: CustomMarker(
                      animation: _easeInAnimation,
                      markerLabel: '7,8mn P',
                    ),
                  ),
                  Marker(
                    point: const LatLng(6.4281, 3.4215),
                    width: 100.0,
                    height: 40.0,
                    child: CustomMarker(
                      animation: _easeInAnimation,
                      markerLabel: '8,5mn P',
                    ),
                  ),
                ])
              ],
            ),
            if (!islayersVisible)
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    islayersVisible = true;
                  });
                },
                child: Container(
                  color: Colors
                      .transparent, 
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: Platform.isIOS ? 70.0 : 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _easeInAnimation,
                    child: SizedBox(
                      height: 45.0,
                      width: 300.0,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 15.0),
                        decoration: InputDecoration(
                            hintText: 'Search location',
                            contentPadding: const EdgeInsets.all(10.0),
                            fillColor: Colors.white,
                            prefixIcon: Image.asset(
                              AppAssets.magnifyingGlassIcon,
                              scale: 20.0,
                            ),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  ScaleTransition(
                    scale: _easeInAnimation,
                    child: IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        icon: Image.asset(
                          AppAssets.settingsIcon,
                          scale: 35.0,
                        )),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: const Alignment(-0.55, 0.6),
                  child: AnimatedOpacity(
                    opacity: islayersVisible ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: IgnorePointer(
                      ignoring: islayersVisible,
                      child: Container(
                        width: 160.0,
                        height: 135.0,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white),
                        child: Column(
                          children: [
                            LayerTiles(
                              onTap: () {
                                setState(() {
                                  islayersVisible = !islayersVisible;
                                });
                              },
                              title: 'Cosy Areas',
                              iconPath: AppAssets.shieldIcon,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            LayerTiles(
                              onTap: () {
                                setState(() {
                                  islayersVisible = !islayersVisible;
                                });
                              },
                              title: 'Price',
                              iconPath: AppAssets.walletIcon,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            LayerTiles(
                              onTap: () {
                                setState(() {
                                  islayersVisible = !islayersVisible;
                                });
                              },
                              title: 'Infrastructure',
                              iconPath: AppAssets.shoppingBasketIcon,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            LayerTiles(
                              onTap: () {
                                setState(() {
                                  islayersVisible = !islayersVisible;
                                });
                              },
                              title: 'Without any layer',
                              iconPath: AppAssets.layersIcon,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(-0.7, 0.67),
                  child: AnimatedOpacity(
                    opacity: islayersVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: IgnorePointer(
                      ignoring: !islayersVisible,
                      child: SizedBox(
                        height: 35.0,
                        width: 35.0,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            child: IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.3),
                                ),
                                onPressed: () {
                                  setState(() {
                                    islayersVisible = !islayersVisible;
                                  });
                                },
                                icon: Image.asset(
                                  AppAssets.walletIcon,
                                  color: Colors.white,
                                  scale: 30.0,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Align(
              alignment: const Alignment(-0.7, 0.78),
              child: SizedBox(
                height: 35.0,
                width: 35.0,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.3),
                        ),
                        onPressed: () {},
                        icon: Image.asset(
                          AppAssets.sendIcon,
                          color: Colors.white,
                          scale: 36.0,
                        )),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.7, 0.78),
              child: SizedBox(
                height: 35.0,
                width: 130.0,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.3)),
                        child: Row(
                          children: [
                            Image.asset(
                              AppAssets.leftAlignIcon,
                              color: Colors.white,
                              scale: 35.0,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Text(
                              'List of varients',
                              style: TextStyle(
                                  fontSize: 11.0, color: Colors.white),
                            )
                          ],
                        )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
