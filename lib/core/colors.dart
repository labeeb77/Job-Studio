

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

const themeColor =  Color(0xFF8b157f);
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;
const kGreyColor = Colors.grey;

LinearGradient myGradient = const LinearGradient(
  colors: [ui.Color(0xFFECEFF1), ui.Color(0xFF607D8B)],
  stops: [0.0, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter);