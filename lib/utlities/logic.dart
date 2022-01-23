import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logic {


static  bool isGradient = false;
static  bool isBgs = false;
static  bool isColors = false;


static double shadowRadius = 0.0;
static double shadowDx = 0.0;
static double shadowDy = 0.0;
static Color shadowColors = Colors.red;
static Color bgsColors = Colors.red;
static var bgsOpactyValue = 1.0;
static var EffectOpactyValue = 1.0;
static String selectedEffect = '';
static LinearGradient bgsgradient =LinearGradient(colors: [Colors.white12,Colors.black87]);

}