import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/analog_clock_painter.dart';

class AnalogClockScreen extends StatefulWidget {
  const AnalogClockScreen({super.key});

  @override
  State<AnalogClockScreen> createState() => _AnalogClockScreenState();
}

class _AnalogClockScreenState extends State<AnalogClockScreen> {
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomPaint(painter: AnalogClockPainter(now)),
        ),
      ),
    );
  }
}
