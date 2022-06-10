import 'package:flutter/cupertino.dart';

const String logoadr =
    'https://ethereum.org/static/a183661dd70e0e5c70689a0ec95ef0ba/cdbe4/eth-diamond-purple.webp';
Color kPrimaryColor = const Color(0xFF347AF0);
Color kGreen = const Color(0xFF75BF72);
Color kRed = const Color(0xFFDF5060);
Color kYellow = const Color(0xFFfdb32a);
Color kMidNightBlue = const Color(0xFF0d1f3c);
Color kDarkGrey = const Color(0xFF3A3A3A);
Color kGrey = const Color(0xFFEDF1F9);
Color kBgGrey = const Color(0xFF979797);

Gradient shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
