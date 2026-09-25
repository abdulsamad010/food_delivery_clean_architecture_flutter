import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class RestaurantCard extends StatelessWidget {
  final res;
  const RestaurantCard({super.key,required this.res});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 285.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 181.h,
              child: Image.network("${res["image"]}",fit: BoxFit.cover,
              width: double.infinity,
                height: 181.h,

                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100.w,
                    height: 100.h,
                    color: lightGrey,
                    child: Icon(
                      Icons.fastfood,
                      size: 40,
                      color: grey,
                    ),
                  );
                },

              ),
            ),
          ),

          SizedBox(height: 8.h,),

          Text("${res["name"]}",style: TextStyle(
              color: black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 1
          ),),


          SizedBox(height: 3.h,),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: res["categories"].length,
                itemBuilder: (context,index){

                return Row(
                  children: [
                    Text("${res["categories"][index]}",style: TextStyle(
                        color: grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 1
                    ),),

                    index!=(res["categories"].length)-1 ?
                    Center(child: Text(" - ",style: TextStyle(
                      color: grey
                    ),)) : SizedBox(),
                  ],
                );

            }),
          ),


          SizedBox(height: 8.h,),

          Row(
            mainAxisSize: MainAxisSize.max,

            children: [

              Icon(Icons.star_border,color: orange,size: 25.sp,),
              Text("${res["rating"]}",style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1
              ),),

          Expanded(child: SizedBox()),

              Icon(Icons.delivery_dining,color: orange,size: 25,),
              Text("${res["delivery"]}",style: TextStyle(
                  color: darkGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1
              ),),

              Expanded(child: SizedBox()),

              Icon(Icons.watch_later_outlined,color: orange,size: 25,),
              Text("${res["deliveryTime"]}",style: TextStyle(
                  color: darkGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1
              ),),

            ],
          )


        ],
      ),
    );
  }
}
