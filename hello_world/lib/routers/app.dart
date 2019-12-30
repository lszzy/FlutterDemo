import 'package:flutter/material.dart';

enum ENV {
  DEV,
  TEST,
  PROD,
}

class App {
  static ENV env = ENV.DEV;
  
}