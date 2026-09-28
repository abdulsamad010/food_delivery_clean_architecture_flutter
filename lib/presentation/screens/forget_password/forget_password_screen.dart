import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week8_task/presentation/screens/home/home_screen.dart';
import '../../theme/app_colors.dart';
import '../../widgets/input_field.dart';
import '../login/login_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  final con1=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(

              children: [

                SvgPicture.asset("assets/icons/BG Asset.svg",colorFilter: ColorFilter.linearToSrgbGamma(),width: MediaQuery.sizeOf(context).width,),

                Padding(
                  padding: EdgeInsets.only(top:140.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      Text("Forget Password",style: TextStyle(
                          color: white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),),

                      SizedBox(height: 16.h,),


                      Text("Please sign in to your existing account",style: TextStyle(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),

                      SizedBox(height: 44.h,),


                      Container(
                        height: MediaQuery.sizeOf(context).height,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(35.r),topRight: Radius.circular(35)),
                            color: white
                        ),

                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("Email",style: TextStyle(
                                color: black,
                                fontSize: 20,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold
                            ),),

                            SizedBox(height: 12.h,),

                            InputField(name: "example@gmail.com", con: con1, isVisible: false),


                            SizedBox(height: 32.h,),

                            SizedBox(
                              width: double.infinity,
                              height: 50.h,
                              child: ElevatedButton(onPressed: (){
                                if(con1.text.isNotEmpty) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                }},
                                  style: ElevatedButton.styleFrom(backgroundColor: orange,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5))
                                  ),
                                  child: Text("Send Password Reset Link",
                                    style: TextStyle(color: white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        fontSize: 17),
                                  )),
                            ),





                          ],
                        ),

                      )


                    ],
                  ),
                ),
              ]),
        ),
      ),

    );
  }
}
