import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/presentation/screens/onboarding/onboarding3_screen.dart';
import 'package:week8_task/presentation/theme/app_colors.dart';

import '../login/login_screen.dart';

class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:white,

      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              height: 250.h,
            width: 150.w,
                decoration: BoxDecoration(
                  color: lightOrange,
                  borderRadius: BorderRadiusGeometry.circular(5),
                  border: Border.all(color: Colors.red)
                ),
                child: Icon(Icons.shopping_cart,color: Colors.red,size: 100.sp,),
            ),

            SizedBox(height: 64.h,),

            Text("Order with ease",style: TextStyle(color: black,fontWeight: FontWeight.bold,
            fontSize: 24
            ),),

            SizedBox(height: 16.h,),

            Text(
              textAlign: TextAlign.center,
              "Find your favorite meals quickly and place your order with just a few simple steps.",style: TextStyle(color: grey,fontWeight: FontWeight.bold,
                fontSize: 13
            ),),


            SizedBox(height: 32.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ClipOval(
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: lightOrange,
                    ),
                  ),
                ),

                SizedBox(width: 16.w,),

                ClipOval(
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: orange,
                    ),
                  ),
                ),

                SizedBox(width: 16.w,),

                ClipOval(
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: lightOrange,
                    ),
                  ),
                ),

                SizedBox(width: 16.w,),

                ClipOval(
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: lightOrange,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 64.h,),

            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Onboarding3Screen()));
              },
                  style: ElevatedButton.styleFrom(backgroundColor: orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5))
                  ),
                  child: Text("Next",
              style: TextStyle(color: white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 17),
              )),
            ),

            SizedBox(height: 16.h,),

            TextButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            }, child: Text(
              "Skip",
              style: TextStyle(
                color: grey,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 17
              ),
            ))

          ],
        ),
      ),
    );
  }
}
