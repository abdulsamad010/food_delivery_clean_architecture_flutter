import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class RestaurantCard extends StatelessWidget {
  final res;
  const RestaurantCard({super.key,required this.res});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network("${res["image"]}",
          width: double.infinity,
            height: 150.h,
          ),
        ),

        SizedBox(height: 8.h,),

        Text("${res["name"]}",style: TextStyle(
            color: black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
            letterSpacing: 1
        ),),


        SizedBox(height: 8.h,),

        ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: res["categories"].length,
            itemBuilder: (context,index){

            return Row(
              children: [
                Text("${res["categories"][index]}",style: TextStyle(
                    color: grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    letterSpacing: 1
                ),),

                index==(res["categories"].length)-1 ?
                Center(child: Icon(Icons.minimize,color: grey,)) : SizedBox(),
              ],
            );

        }),


        SizedBox(height: 8.h,),

        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [

            Icon(Icons.star_border,color: orange,),
            Text("${res["rating"]}",style: TextStyle(
                color: black,
                fontWeight: FontWeight.bold,
                fontSize: 6,
                letterSpacing: 1
            ),),


            Icon(Icons.delivery_dining,color: orange,),
            Text("${res["delivery"]}",style: TextStyle(
                color: black,
                fontWeight: FontWeight.bold,
                fontSize: 6,
                letterSpacing: 1
            ),),


            Icon(Icons.watch_later_outlined,color: orange,),
            Text("${res["deliveryTime"]}",style: TextStyle(
                color: black,
                fontWeight: FontWeight.bold,
                fontSize: 6,
                letterSpacing: 1
            ),),

          ],
        )


      ],
    );
  }
}
