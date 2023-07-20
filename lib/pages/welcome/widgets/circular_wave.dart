import 'package:flutter/material.dart';

class CircularWave extends StatelessWidget {
  const CircularWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxWidth: MediaQuery.of(context).size.width,
      child: CustomPaint(painter: _CircularWavePainter()),
    );
  }
}

class _CircularWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Offset href = Offset(size.width / 2, size.height / 2);
    // left:2efab7  [46 250 183] right: # 27ebbb [39 235 187]
    for (var i = 1; i <= 10; i++) {
      var paint = Paint()
        ..style = PaintingStyle.fill
        ..color =
            Color.fromRGBO(40, 235, (255 * i * 0.1).toInt(), 0.32 - 0.03 * i);
      canvas.drawCircle(href, size.width / 8 + i * 45, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
