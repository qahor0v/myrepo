import 'dart:html';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:sws/mobile_app/src/utils/constants/asset_icons.dart';

class WebBackWrapper extends StatefulWidget {
  final Widget child;
  const WebBackWrapper({
    super.key,
    required this.child,
  });

  @override
  State<WebBackWrapper> createState() => _WebBackWrapperState();
}

class _WebBackWrapperState extends State<WebBackWrapper>
    with TickerProviderStateMixin {
  ParticleOptions particleOptions = ParticleOptions(
    image: Image.asset("assets/icons/footbal.png"),
    baseColor: Colors.blue,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    spawnMinSpeed: 30.0,
    spawnMaxSpeed: 70.0,
    spawnMinRadius: 7.0,
    spawnMaxRadius: 15.0,
    particleCount: 40,
  );

  var particlePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  // Lines

  final _lineDirection = LineDirection.Ltr;
  final int _lineCount = 50;

  // Bubbles
  final BubbleOptions _bubbleOptions = const BubbleOptions();

  // General Variables
  final int _behaviourIndex = 0;
  // ignore: unused_field
  Behaviour? _behaviour;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: AnimatedBackground(
        behaviour: _behaviour = _buildBehaviour(),
        vsync: this,
        child: widget.child,
      ),
    );
  }

  Behaviour _buildBehaviour() {
    switch (_behaviourIndex) {
      case 0:
        return RandomParticleBehaviour(
          options: particleOptions,
          paint: particlePaint,
        );
      case 1:
        return RandomParticleBehaviour(
          options: particleOptions,
          paint: particlePaint,
        );
      case 2:
        return RectanglesBehaviour();
      case 3:
        return RacingLinesBehaviour(
          direction: _lineDirection,
          numLines: _lineCount,
        );
      case 4:
        return BubblesBehaviour(
          options: _bubbleOptions,
        );
      case 5:
        return SpaceBehaviour();
    }

    return RandomParticleBehaviour(
      options: particleOptions,
      paint: particlePaint,
    );
  }
}
