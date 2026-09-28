import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/presentation/widgets/input_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/app_colors.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {

  TextEditingController con1=TextEditingController();
  TextEditingController con2=TextEditingController();
  TextEditingController con3=TextEditingController();
  TextEditingController con4=TextEditingController();
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
        
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
        
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_circle_left,size: 35.sp,
                    color: white,
                    )),
        
        
                    SizedBox(height: 90.h,),
        
                    Center(
                      child: Text("Sign Up",style: TextStyle(
                        color: white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
        
                    SizedBox(height: 16.h,),
        
        
                    Center(
                      child: Text("Please sign up to get started",style: TextStyle(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
        
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
        
                          Text("NAME",style: TextStyle(
                              color: black,
                              fontSize: 15,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold
                          ),),
        
                          SizedBox(height: 12.h,),
        
                          InputField(name: "Abdul Samad", con: con1, isVisible: false),
        
        
                          SizedBox(height: 32.h,),
        
        
                          Text("EMAIL",style: TextStyle(
                              color: black,
                              fontSize: 15,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold
                          ),),
        
                          SizedBox(height: 12.h,),
        
                          InputField(name: "abdulsamadabbasi010@gmail.com", con: con2, isVisible: false),
        
                          SizedBox(height: 32.h,),
        
        
                          Text("PASSWORD",style: TextStyle(
                              color: black,
                              fontSize: 15,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold
                          ),),
        
                          SizedBox(height: 12.h,),
        
                          InputField(name: "123456", con: con3, isVisible: true),
        
                          SizedBox(height: 32.h,),
        
                          Text("RE-TYPE PASSWORD",style: TextStyle(
                              color: black,
                              fontSize: 15,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold
                          ),),
        
                          SizedBox(height: 12.h,),
        
                          InputField(name: "123456", con: con4, isVisible: true),
        
        
        
                          SizedBox(height: 54.h,),
        
        
                          SizedBox(
                            width: double.infinity,
                            height: 50.h,
                            child: ElevatedButton(onPressed: (){
                              if(fK.currentState!.validate()) {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              } },
                                style: ElevatedButton.styleFrom(backgroundColor: orange,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5))
                                ),
                                child: Text("SIGN UP",
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
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
