import 'package:drone_assist/feature/welcome/widgets/beer_background_painter.dart';
import 'package:flutter/material.dart';

class BeerBackgroundWidget extends StatefulWidget {
  const BeerBackgroundWidget({super.key});

  @override
  State<BeerBackgroundWidget> createState() => _BeerBackgroundWidgetState();
}

class _BeerBackgroundWidgetState extends State<BeerBackgroundWidget>
    with TickerProviderStateMixin {
  late final AnimationController bubbleController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2000),
  );

  late final Animation<double> bubbleAnimation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: bubbleController,
      curve: Curves.linear,
    ),
  );

  late final AnimationController foamController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2000),
    reverseDuration: const Duration(milliseconds: 3000),
  );

  late final Animation<double> foamAnimation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: foamController,
      curve: Curves.linear,
    ),
  );

  @override
  void initState() {
    bubbleController.repeat();
    foamController.repeat(
      reverse: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    bubbleController.dispose();
    foamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          painter: BeerBackgroundPainter(
            bubbleAnimation: bubbleAnimation,
            foamAnimation: foamAnimation,
            beerColor: Colors.amber,
            foamColor: Colors.white,
          ),
          size: Size(
            constraints.maxWidth,
            constraints.maxHeight,
          ),
        );
      },
    );
  }
}
