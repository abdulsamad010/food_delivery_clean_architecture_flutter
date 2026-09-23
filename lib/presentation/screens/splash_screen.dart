import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(child: SizedBox()),

            SvgPicture.asset("assets/icons/Logo.svg"),

            Expanded(child: SizedBox()),

            Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset("assets/icons/Ellipse 1006.svg"),
            )
          ],
        ),
      ),
    );
  }
}
