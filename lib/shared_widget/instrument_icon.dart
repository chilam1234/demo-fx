import 'dart:math';

import 'package:flutter/material.dart';

class InstrumentIcon extends StatelessWidget {
  final String name;
  final double? size;

  const InstrumentIcon({
    Key? key,
    required this.name,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hash = name.hashCode % 16 / 16 * 255;
    final color = HSLColor.fromAHSL(1, hash.toDouble(), 0.8, 0.4).toColor();

    var abbr = name.substring(0, min(2, name.length)).toUpperCase();

    return SizedBox(
      width: size,
      height: size,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: FittedBox(
          child: Text(
            abbr,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
