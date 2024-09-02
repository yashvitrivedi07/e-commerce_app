import 'package:flutter/material.dart';

extension SIZE on int {

  SizedBox get ofHeight => SizedBox(
    height: toDouble(),
  );
  
  SizedBox get ofWidth => SizedBox(
    width: toDouble(),
  );

}

