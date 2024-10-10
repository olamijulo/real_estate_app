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

class _SearchScreenState extends State<SearchScreen> {
  bool islayersVisible = true;
  double menuSpacing = 2.5;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              backgroundColor: black,
              initialCenter:
                  LatLng(6.5244, 3.3792), // Center the map over London
              initialZoom: 11.2,
            ),
            children: [
              TileLayer(
                // Display map tiles from any source
                urlTemplate:
                    "https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png",
                subdomains: const ['a', 'b', 'c', 'd'],
                // And many more recommended properties!
              ),
              RichAttributionWidget(
                // Include a stylish prebuilt attribution widget that meets all requirments
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                    onTap: () => (Uri.parse(
                        'https://openstreetmap.org/copyright')), // (external)
                  ),
                  // Also add images...
                ],
              ),
              MarkerLayer(markers: [
                Marker(
                  point: const LatLng(6.4500, 3.4120),
                  width: 40.0,
                  height: 40.0, // Marker location
                  child: Container(
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
                  ),
                ),
                const Marker(
                  point: LatLng(6.4534, 3.4510),
                  width: 40.0,
                  height: 40.0, // Marker location
                  child: CustomMarker(),
                ),
                const Marker(
                  point: LatLng(6.4170, 3.4707),
                  width: 40.0,
                  height: 40.0, // Marker location
                  child: CustomMarker(),
                ),
                const Marker(
                  point: LatLng(6.4504, 3.4002),
                  width: 40.0,
                  height: 40.0, // Marker location
                  child: CustomMarker(),
                ),
                const Marker(
                  point: LatLng(6.4281, 3.4215),
                  width: 40.0,
                  height: 40.0, // Marker location
                  child: CustomMarker(),
                ),
              ])
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45.0,
                  width: 300.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Search location',
                        contentPadding: const EdgeInsets.all(10.0),
                        fillColor: Colors.white,
                        prefixIcon: Image.asset(
                          AppAssets.magnifyingGlassIcon,
                          scale: 18.0,
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
                const SizedBox(
                  width: 5.0,
                ),
                IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors
                          .white, // Set the background color of the button
                      // Set the color of the icon
                    ),
                    onPressed: () {},
                    icon: Image.asset(
                      AppAssets.settingsIcon,
                      scale: 35.0,
                    ))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, bottom: 80.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Visibility(
                        visible: islayersVisible,
                        replacement: Container(
                          width: 180.0,
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
                                    menuSpacing = 2.5;
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
                                    menuSpacing = 2.5;
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
                                    menuSpacing = 2.5;
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
                                    menuSpacing = 2.5;
                                  });
                                },
                                title: 'Without any layer',
                                iconPath: AppAssets.layersIcon,
                              ),
                            ],
                          ),
                        ),
                        child: SizedBox(
                          height: 35.0,
                          width: 35.0,
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: IconButton(
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.white.withOpacity(
                                        0.3), // Set the background color of the button
                                    // Set the color of the icon
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      islayersVisible = !islayersVisible;
                                      menuSpacing = 34.5;
                                    });
                                  },
                                  icon: Image.asset(
                                    AppAssets.layersIcon,
                                    color: Colors.white54,
                                    scale: 30.0,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      SizedBox(
                        height: 35.0,
                        width: 35.0,
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            child: IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.3),
                                ),
                                onPressed: () {},
                                icon: Image.asset(
                                  AppAssets.sendIcon,
                                  color: Colors.white54,
                                  scale: 36.0,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / menuSpacing,
                  ),
                  SizedBox(
                    height: 45.0,
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
