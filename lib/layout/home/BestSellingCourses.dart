import 'package:flutter/material.dart';
import 'package:flutter_task/style/appcolors.dart';

import '../../model/Best_Selling.dart';

class BestSellingWidget extends StatelessWidget {
  BestSellingCourses? bestSellingCourse;
  BestSellingWidget({required this.bestSellingCourse});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)

      ) ,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment. spaceAround,
          children: [
            Image.asset("assets/images/route 1.jpg",width: 60,height:50,fit:BoxFit. cover, ),
            Column(
              children: [
                Text(bestSellingCourse?.title??"",style: Theme.of(context).textTheme.bodyMedium,),
                Text(" ${bestSellingCourse?.numberOfStudents} student Enrolled",style:Theme.of(context).textTheme.labelSmall),
              ],
            ),
            ElevatedButton(
                style:ElevatedButton.styleFrom( backgroundColor: AppColors.primaryLightColor) ,
                onPressed: (){} ,
                child: Text("Join ",style: TextStyle(fontSize: 15 , color: Colors.white),))
          ],
        ),
      ),
    ) ;
  }
}