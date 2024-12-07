import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mohamed/ui/Order%20management.dart';
import 'package:mohamed/ui/SharedPreference.dart';
import 'package:mohamed/ui/language.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'Splash-Screen';

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),(){
      String initialRoute = SharedPreferenceUtils.getData(key:'token') == null
          ? language.routeName
          : Ordermanagement.routeName;
      Navigator.of(context).pushReplacementNamed(initialRoute);
      //print('oooosfkjsdfhsdkjf =$initialRoute');
    });
    return Scaffold(
      backgroundColor: const Color(0xFF7785DB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/bandora-low-resolution-color-logo 1.png',),
          ],
        ),
      ),

    );
  }
}
