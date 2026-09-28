import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: Padding(
          padding:EdgeInsets.only(bottom: 4.w,top:4.w,left: 4.w),
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(

              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightGrey
              ),

              child: Center(child: Icon(Icons.arrow_back_ios_new,size: 14.sp,)),
            ),
          ),
        ),

        title: Text("Add Card",style: TextStyle(
            color: black,
            fontSize: 18
        ),),
      ),

      backgroundColor: white,


      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset("assets/images/img.png",width: 20.w,height: 20.h,),
                )
              ],
            )
          ],
        ),
      ),


    );
  }
}
