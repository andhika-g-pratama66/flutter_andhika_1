// lib/widgets/shimmer_box.dart

import 'package:flutter/material.dart';

class ShimmerBox extends StatefulWidget {
  final double? width;
  final double? height;
  final double borderRadius;

  const ShimmerBox({super.key, this.width, this.height, this.borderRadius = 0});

  @override
  State<ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<ShimmerBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.3, end: 0.7).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // smoother than linear
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) => ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Container(
          width: widget.width,
          height: widget.height,
          color: Colors.grey.withOpacity(_animation.value),
        ),
      ),
    );
  }
}
