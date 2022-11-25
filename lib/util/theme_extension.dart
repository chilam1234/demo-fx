import 'package:flutter/material.dart';

class InstrumentStyle extends ThemeExtension<InstrumentStyle> {
  final Color? gain;
  final Color? loss;

  const InstrumentStyle({
    required this.gain,
    required this.loss,
  });

  @override
  InstrumentStyle copyWith({Color? gain, Color? loss}) {
    return InstrumentStyle(
      gain: gain ?? this.gain,
      loss: loss ?? this.loss
    );
  }

  @override
  ThemeExtension<InstrumentStyle> lerp(ThemeExtension<InstrumentStyle>? other, double t) {
    if (other is! InstrumentStyle) {
      return this;
    }

    return InstrumentStyle(
      gain: Color.lerp(gain, other.gain, t),
      loss: Color.lerp(loss, other.loss, t),
    );
  }
}
