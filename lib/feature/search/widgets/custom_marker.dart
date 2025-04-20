import 'package:flutter/material.dart';
import 'package:real_estate_app/app/common/app_assets.dart';
import 'package:real_estate_app/app/common/app_colors.dart';

class CustomMarker extends StatefulWidget {
  Animation<double> animation;
  String markerLabel;

  CustomMarker({
    super.key,
    required this.animation,
    required this.markerLabel,
  });

  @override
  State<CustomMarker> createState() => _CustomMarkerState();
}

class _CustomMarkerState extends State<CustomMarker> {
  bool isMarkerVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () {
          setState(() {
            isMarkerVisible = !isMarkerVisible;
          });
        },
        child: AnimatedOpacity(
          opacity: isMarkerVisible ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 500),
          child: SizeTransition(
            sizeFactor: widget.animation,
            axis: Axis.horizontal,
            child: IgnorePointer(
              ignoring: isMarkerVisible,
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
                  scale: 30.0,
                ),
              ),
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {
            isMarkerVisible = !isMarkerVisible;
          });
        },
        child: AnimatedOpacity(
          opacity: isMarkerVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 1000),
          child: IgnorePointer(
            ignoring: !isMarkerVisible,
            child: SizeTransition(
              sizeFactor: widget.animation,
              axis: Axis.horizontal,
              child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                      color: orange,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  child: Text(
                    widget.markerLabel,
                    style: const TextStyle(fontSize: 12.0, color: Colors.white),
                  )),
            ),
          ),
        ),
      )
    ]);
  }
}
