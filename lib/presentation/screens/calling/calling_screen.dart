import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/presentation/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallingScreen extends StatefulWidget {
  const CallingScreen({super.key});

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlueGrey,
      body: Column(
        children: [
          Expanded(child: Image.asset("assets/images/img.png",fit: BoxFit.cover,)),
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(color: white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            ClipOval(
              child: Image.asset("assets/images/img.png",height: 70.h,width: 55.w,fit: BoxFit.cover,),
            ),

            SizedBox(height: 8.h,),

            Text("Robert F",style: TextStyle(color: black,
                fontWeight: FontWeight.bold,fontSize: 18),),


            SizedBox(height: 8.h,),

            Text("Connecting......",style: TextStyle(color: darkGrey,
                fontWeight: FontWeight.bold,fontSize: 15),),

            SizedBox(height: 32.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                SvgPicture.asset("assets/icons/Mute.svg"),
                Transform.translate(

                  offset: Offset(0, -30),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Stack(children:[

                        Image.asset("assets/images/End Icon.png")

                  ])),
                ),
                SvgPicture.asset("assets/icons/Speaker.svg"),

              ],
            )




          ],
        ),
      ),
    );
  }
}
