import 'dart:math';
import 'package:flutter/material.dart';

class AnalogClockPainter extends CustomPainter {
  final DateTime dateTime;

  AnalogClockPainter(this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final radius = min(size.width / 2, size.height / 2);

    final paintCircle = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawCircle(center, radius, paintCircle);

    for (int i = 0; i < 12; i++) {
      double angle = (pi / 6) * i;

      Offset start = Offset(
        center.dx + (radius - 15) * cos(angle - pi / 2),
        center.dy + (radius - 15) * sin(angle - pi / 2),
      );

      Offset end = Offset(
        center.dx + radius * cos(angle - pi / 2),
        center.dy + radius * sin(angle - pi / 2),
      );

      canvas.drawLine(
        start,
        end,
        Paint()
          ..strokeWidth = 3
          ..color = Colors.blue,
      );
    }

    double hourAngle =
        ((dateTime.hour % 12) + dateTime.minute / 60) * 30 * pi / 180;

    double minuteAngle =
        (dateTime.minute + dateTime.second / 60) * 6 * pi / 180;

    double secondAngle = dateTime.second * 6 * pi / 180;

    drawHand(canvas, center, hourAngle, radius * 0.5, 6, Colors.black);

    drawHand(canvas, center, minuteAngle, radius * 0.7, 4, Colors.black);

    drawHand(canvas, center, secondAngle, radius * 0.8, 2, Colors.red);

    canvas.drawCircle(center, 8, Paint()..color = Colors.blue);
  }

  void drawHand(
    Canvas canvas,
    Offset center,
    double angle,
    double length,
    double width,
    Color color,
  ) {
    final handPaint = Paint()
      ..color = color
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;

    final end = Offset(
      center.dx + length * cos(angle - pi / 2),
      center.dy + length * sin(angle - pi / 2),
    );

    canvas.drawLine(center, end, handPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
