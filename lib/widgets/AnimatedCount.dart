import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnimatedNumber extends StatefulWidget {
  final int targetNumber;
  final Duration duration;
  final Color textColor;

  const AnimatedNumber({Key? key, required this.targetNumber, this.duration = const Duration(milliseconds: 500), required this.textColor}) : super(key: key);

  @override
  _AnimatedNumberState createState() => _AnimatedNumberState();
}

class _AnimatedNumberState extends State<AnimatedNumber> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = IntTween(begin: 0, end: widget.targetNumber).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_animation.value}',
      style: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        color: widget.textColor
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// Usage:
