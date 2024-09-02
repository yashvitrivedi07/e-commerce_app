import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/datail_page.dart';
import 'package:flutter_application_1/views/home_page.dart';
import 'package:flutter_application_1/views/sign_up.dart';
import 'package:flutter_application_1/views/cart_page.dart';

void main() {
  runApp(Run());
}

class Run extends  StatelessWidget {
  const Run({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) =>  HomePage(),
      'detail_page':(context) =>  DetailPage(),
      'sign_up': (context) => SignUp(),
      'cart_page': (context) => Cart(),

    },);
  }
}
