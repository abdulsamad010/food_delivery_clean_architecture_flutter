import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:week8_task/presentation/screens/home/home_screen.dart';
import 'package:week8_task/presentation/widgets/input_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/app_colors.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController con1=TextEditingController();
  TextEditingController con2=TextEditingController();
  final fK=GlobalKey<FormState>();

  bool value=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Center(
          child: Form(
            key: fK,
            child: SingleChildScrollView(
              child: Stack(
        
                children: [
        
                Transform.translate(
                    offset: Offset(0, -20.h),
                    child: SvgPicture.asset("assets/icons/BG Asset.svg",colorFilter: ColorFilter.linearToSrgbGamma(),width: MediaQuery.sizeOf(context).width,)),
        
              Padding(
                padding: EdgeInsets.only(top:140.h),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
        
                      Text("Log In",style: TextStyle(
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
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(35.r),topRight: Radius.circular(35.r)),
                          color: white
                        ),
        
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
        
                            Text("Email",style: TextStyle(
                                color: black,
                                fontSize: 15,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold
                            ),),
        
                            SizedBox(height: 12.h,),
        
                            InputField(name: "example@gmail.com", con: con1, isVisible: false),
        
        
                            SizedBox(height: 32.h,),
        
        
                            Text("Password",style: TextStyle(
                                color: black,
                                fontSize: 15,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold
                            ),),
        
                            SizedBox(height: 12.h,),
        
                            InputField(name: "123456", con: con2, isVisible: true),
        
                            SizedBox(height: 16.h,),
        
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(value: value, onChanged: (v){value=v!;}),
                                    Text("Remember me",style: TextStyle(
                                        color: darkGrey,
                                        fontSize: 15,
                                    ),),
                                  ],
                                ),
        
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordScreen()));
                                }, child: Text("Forget Password",style: TextStyle(
                                  color: orange,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),))
                              ],
                            ),
        
                            SizedBox(height: 32.h,),
        
                            SizedBox(
                              width: double.infinity,
                              height: 50.h,
                              child: ElevatedButton(onPressed: (){
                                if(fK.currentState!.validate()) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                }},
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
        
                            SizedBox(height: 42.h,),
        
        
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
        
        
                                Text("Don't have an account?",
                                  style: TextStyle(color: grey,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontSize: 14),
                                ),
        
                                SizedBox(width: 8.w,),
        
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                                }, child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      color: orange,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontSize: 16
                                  ),
                                )),
                              ],
                            ),
        
        
                            SizedBox(height: 32.h,),
        
                            Center(child: SvgPicture.asset("assets/icons/Social Icon.svg")),
        
                          ],
                        ),
        
                      )
        
        
                    ],
                  ),
              ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
