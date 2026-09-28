import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week8_task/presentation/bloc/app_bloc.dart';
import 'package:week8_task/presentation/bloc/app_event.dart';
import 'package:week8_task/presentation/bloc/app_state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week8_task/presentation/widgets/input_field.dart';
import '../../theme/app_colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final con=TextEditingController();
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

              child: Center(child: Icon(Icons.arrow_back_ios,size: 14.sp,)),
            ),
          ),
        ),

        title: Text("Robert F",style: TextStyle(
            color: black,
            fontSize: 18
        ),),
      ),

      backgroundColor: white,

      body: SafeArea(
        child: BlocBuilder<AppBloc,AppState>(
            builder: (context,state)=>SingleChildScrollView(
              child: Column(
                children: [
        
        
                  ListView.builder(
                    shrinkWrap: true,
                      itemCount: state.chat.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
        
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
        
        
                            Row(
        
                              mainAxisAlignment: state.chat[index]["name"]=="Delivery Man" ?  MainAxisAlignment.start: MainAxisAlignment.end,
                              children: [
                                state.chat[index]["name"]!="Delivery Man" ?
                                SvgPicture.asset("assets/icons/Check.svg") : ClipOval(
                                  child: Image.asset("assets/images/img2.jpg",fit: BoxFit.cover,height: 60.h,width: 45.w,),
                                ),
        
                                SizedBox(width: 8.w,),
        
                                Column(
                                  crossAxisAlignment: state.chat[index]["name"]=="Delivery Man" ?  CrossAxisAlignment.end: CrossAxisAlignment.start,
        
                                  children: [
                                    Text("${state.chat[index]["time"]}",style: TextStyle(
                                        color: darkGrey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal
                                    ),),
        
                                    Container(
                                      padding: EdgeInsets.all(16.w),
                                      decoration: BoxDecoration(
                                        color: state.chat[index]["name"]!="Delivery Man" ? orange : blueGrey,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Text("${state.chat[index]["message"]}",style: TextStyle(
                                          color: white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold
                                      ),),
        
                                    ),
                                  ],
                                ),
        
                                SizedBox(width: 4.w,),
        
                                state.chat[index]["name"]!="Delivery Man" ? ClipOval(
                                  child: Image.asset("assets/images/img.png",fit: BoxFit.cover,height: 60.h,width: 45.w),
                                ) : SizedBox.shrink(),
                              ],
                            ),
                          ],
                        ),
                      );
        
                  }),

                  SizedBox(height: 70.h,),


                ],
              ),
            )),
      ),

      floatingActionButton: Padding(
    padding: EdgeInsets.only(left: 32.w, right: 16.w),
    child: Row(
    children: [
    Expanded(
    child:ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextField(
        controller: con,
        decoration: InputDecoration(
          filled: true,
          fillColor: lightBlueGrey,
          border: InputBorder.none,
          hint: Padding(
            padding:EdgeInsets.all(8.w),
            child: Text("write something",style: TextStyle(color: darkGrey),),
          )
        ),
      ),
    )
    ),
    SizedBox(width: 8.w),
    FloatingActionButton(
    backgroundColor: lightBlueGrey,
    onPressed: () {
    if (con.text.isNotEmpty) {
    context.read<AppBloc>().add(
    UpdateChat(
    date: DateTime.now().toString().substring(11, 16),
    mes: con.text,
    name: "Robert F",
    ),
    );
    con.clear();
    FocusScope.of(context).unfocus();
    }
    },
    child: const Icon(Icons.send,color: orange,),
    ),
    ],
    ),
    ),);
  }
}
