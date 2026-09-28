import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week8_task/presentation/screens/onboarding/onboarding1_screen.dart';
import 'package:week8_task/presentation/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void wait()async{
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Onboarding1Screen()));
  }

  @override
  void initState() {

    super.initState();

    wait();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:white,

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SvgPicture.asset("assets/icons/Ellipse 1005 (1).svg", ),

            Expanded(child: SizedBox()),

            Center(child: SvgPicture.asset("assets/icons/Logo.svg")),

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
