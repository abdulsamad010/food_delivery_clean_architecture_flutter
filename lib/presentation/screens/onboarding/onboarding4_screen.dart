import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/presentation/theme/app_colors.dart';

import '../login/login_screen.dart';

class Onboarding4Screen extends StatelessWidget {
  const Onboarding4Screen({super.key});

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
                child: Icon(Icons.delivery_dining,color: Colors.red,size: 100.sp,),
            ),

            SizedBox(height: 64.h,),

            Text("Free delivery offers",style: TextStyle(color: black,fontWeight: FontWeight.bold,
            fontSize: 24
            ),),

            SizedBox(height: 16.h,),

            Text(
              textAlign: TextAlign.center,
              "Enjoy your favorite meals with exciting offers and free delivery right to your door.",style: TextStyle(color: grey,fontWeight: FontWeight.bold,
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
              ],
            ),

            SizedBox(height: 64.h,),

            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(LoginScreen())));
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
