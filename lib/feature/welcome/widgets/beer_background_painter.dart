import 'dart:math' as math;

import 'package:flutter/material.dart';

class BeerBackgroundPainter extends CustomPainter {
  static const borderHeightFraction = 0.2;
  static const sideOffsetFraction = 0.1;
  static const columnsCount = 5;
  static const columnsOffsetFraction = 0.1;
  static const maxColumnHeightFraction = 0.1;

  BeerBackgroundPainter({
    required this.bubbleAnimation,
    required this.foamAnimation,
    required this.beerColor,
    required this.foamColor,
  }) : super(
          repaint: bubbleAnimation,
        );

  final Animation<double> bubbleAnimation;
  final Animation<double> foamAnimation;
  final Color beerColor;
  final Color foamColor;

  @override
  void paint(Canvas canvas, Size size) {
    _paintFoamWave(
      size: size,
      canvas: canvas,
    );

    _paintBubbles(
      size: size,
      canvas: canvas,
    );
  }

  void _paintFoamWave({
    required Size size,
    required Canvas canvas,
  }) {
    final Path borderPath = Path();
    borderPath.moveTo(0, borderHeightFraction * size.height);

    final double waveLength = size.width * 0.29;

    final double totalWaveHeight = size.height * 0.011;
    final double animatedWaveHeight = totalWaveHeight * 0.2;
    final double notAnimatedWaveHeight = totalWaveHeight - animatedWaveHeight;

    final double totalWaveOffset = size.height * 0.11;
    final double animatedWaveOffset = totalWaveOffset * 0.05;
    final double notAnimatedWaveOffset = totalWaveOffset - animatedWaveOffset;

    for (int i = 1; i <= size.width; i++) {
      final double waveSinus = math.sin(math.pi * i / waveLength) + 1;
      final double waveHeight =
          notAnimatedWaveHeight + animatedWaveHeight * foamAnimation.value;
      final double waveOffset =
          animatedWaveOffset * foamAnimation.value + notAnimatedWaveOffset;

      borderPath.lineTo(i.toDouble(), waveSinus * waveHeight + waveOffset);
    }

    borderPath.lineTo(size.width, size.height);
    borderPath.lineTo(0, size.height);
    borderPath.lineTo(0, borderHeightFraction * size.height);

    final Paint paint = Paint()
      ..color = beerColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    canvas.drawPath(
      borderPath,
      paint,
    );
  }

  _paintBubbles({
    required Size size,
    required Canvas canvas,
  }) {
    final double bubbleHorizontalOffset = size.width / 8;

    final animOffsets = {
      0: 0.5,
      1: 0.8,
      2: 0.3,
      3: 0.1,
      4: 0.7,
      5: 0.2,
      6: 0.8,
      7: 0.9,
    };

    final bubbleSizes = {
      0: 0.9,
      1: 1.0,
      2: 0.7,
      3: 1.4,
      4: 0.2,
      5: 0.8,
      6: 1.2,
      7: 1.8,
    };

    for (int bubbleIndex = 0; bubbleIndex <= 7; bubbleIndex++) {
      _drawBubble(
        size: size,
        canvas: canvas,
        horizontalOffset:
            size.width * 0.04 + bubbleHorizontalOffset * bubbleIndex,
        animTimeOffset: animOffsets[bubbleIndex]!,
        bubbleSize: bubbleSizes[bubbleIndex]!,
      );
    }
  }

  void _drawBubble({
    required Size size,
    required Canvas canvas,
    required double horizontalOffset,
    required double animTimeOffset,
    required double bubbleSize,
  }) {
    final correctedAnimationValue = bubbleAnimation.value - animTimeOffset;
    final animationValue = correctedAnimationValue >= 0
        ? correctedAnimationValue
        : 1 + correctedAnimationValue;

    final Paint sinusPaint = Paint()
      ..color = foamColor.withOpacity(
        animationValue < 0.99 ? 1.0 : (1 - animationValue) * 100,
      )
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final double bubbleVerticalSpace = (1 - borderHeightFraction) * size.height;
    final double waveLength = size.height * 0.18;
    final double waveHeight = size.width * 0.029;

    final double waveSinus =
        math.sin(math.pi * bubbleVerticalSpace * animationValue / waveLength) +
            1;

    final double xBubbleOffset = waveSinus * waveHeight + horizontalOffset;

    canvas.drawCircle(
      Offset(
        xBubbleOffset,
        (bubbleVerticalSpace) * (1 - animationValue) +
            borderHeightFraction * size.height,
      ),
      4 * bubbleSize,
      sinusPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (bubbleAnimation.status != AnimationStatus.completed) {
      return true;
    } else {
      return false;
    }
  }
}
