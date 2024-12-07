import 'package:flutter/material.dart';
import 'package:svg_path_parser/svg_path_parser.dart';

class Checker extends StatefulWidget {
  final bool value;
  final void Function(bool value) onChanged;

  const Checker({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  State<Checker> createState() => _CheckerState();
}

class _CheckerState extends State<Checker> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorTweenAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
    );

    _colorTweenAnimation = ColorTween(
      begin: Colors.grey,
      end: const Color(0xff92fd4b),
    ).animate(_controller);

    _controller.addListener(() {
      // Animation state change triggers a rebuild
      setState(() {});
    });

    // Initial state based on widget.value
    if (widget.value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void didUpdateWidget(covariant Checker oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update animation based on the new value
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: InkWell(
        onTap: () => widget.onChanged(!widget.value),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            height: 18.0,
            width: 18.0,
            child: CustomPaint(
              painter: _CheckPainter(
                _colorTweenAnimation.value ?? Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CheckPainter extends CustomPainter {
  final Color color;

  _CheckPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = color.withOpacity(1);
    Path path = parseSvgPath("M5 9.58L8.13 12.8L13.77 6");
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CheckPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
