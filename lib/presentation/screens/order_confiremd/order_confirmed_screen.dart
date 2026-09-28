import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import '../track/track_order_screen.dart';

class OrderConfirmedScreen extends StatefulWidget {
  const OrderConfirmedScreen({super.key});

  @override
  State<OrderConfirmedScreen> createState() => _OrderConfirmedState();
}

class _OrderConfirmedState extends State<OrderConfirmedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,

      body: Padding(padding: EdgeInsets.all(16.w),
        child: Column(
          children: [

            Spacer(),

            Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: lightOrange,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: orange)
                ),
                child: Icon(Icons.celebration,color: orange,size: 70,)),

                SizedBox(height: 16.h,),

             Text("Congratulations!",style: TextStyle(fontWeight: FontWeight.bold,
                 fontSize: 22.sp,
                 color: black),),

            SizedBox(height: 16.h,),

            Text("You successfully maked a payment,enjoy our service!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.sp,
                color: darkGrey),),

                Spacer(),



                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TrackOrderScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Text("TRACK ORDER",style: TextStyle(color: white),)),
                ),


              ],
            ),
          ),
        );
  }
}
