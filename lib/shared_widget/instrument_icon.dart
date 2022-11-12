import 'dart:math';

import 'package:flutter/material.dart';

import '../model/Instrument.dart';

class InstrumentIcon extends StatelessWidget {
  final Instrument instrument;
  final double? size;

  const InstrumentIcon({
    Key? key,
    required this.instrument,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hash = instrument.name.hashCode % 16 / 16 * 255;
    final color = HSLColor.fromAHSL(1, hash.toDouble(), 0.8, 0.4).toColor();

    final name = instrument.name;
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
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
