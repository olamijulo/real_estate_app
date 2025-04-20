import 'package:flutter/material.dart';
import 'package:real_estate_app/app/common/app_colors.dart';

class CutomNavItem extends StatefulWidget {
  const CutomNavItem({
    super.key,
    required this.value,
    required this.selectedIndex,
    required this.imgUrl,
    required this.onTap,
  });

  final int selectedIndex;
  final String imgUrl;
  final int value;
  final VoidCallback onTap;

  @override
  State<CutomNavItem> createState() => _CutomNavItemState();
}

class _CutomNavItemState extends State<CutomNavItem>
    with TickerProviderStateMixin {
  late Animation<Color?> _colorAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _colorAnimation = ColorTween(
      begin: Colors.white12,
      end: orange,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (widget.selectedIndex == widget.value) {
      _controller.forward();
    }
  }

  Future<void> startAnimation() async {
    // Reset and replay animation
    _controller.reset();
    await _controller.forward();
  }

  @override
  void didUpdateWidget(CutomNavItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex == widget.value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        if (widget.selectedIndex == widget.value) {
          startAnimation();
        }
      },
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, _) {
          return Container(
            height: toggleSelectedMenuDimensions(),
            width: toggleSelectedMenuDimensions(),
            decoration: BoxDecoration(
              color: widget.selectedIndex == widget.value
                  ? _colorAnimation.value
                  : black50,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              widget.imgUrl,
              scale: 25.0,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }

  double toggleSelectedMenuDimensions() {
    return widget.selectedIndex == widget.value ? 45.0 : 40.0;
  }
}
