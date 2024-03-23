import 'package:flutter/material.dart';
import 'package:flutter_task/style/appcolors.dart';
import 'package:flutter_task/style/theme.dart';
import 'package:flutter_task/model/FeaturedCourses.dart';

class FeaturedCoursesWidget extends StatelessWidget {
  FeaturedCourses featuredCourse;
  FeaturedCoursesWidget({required this.featuredCourse});
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Border radius for the image container
                border: Border.all( // Border properties
                  color: Theme.of(context).primaryColorLight, // Border color

                  // Bor// der width
                ),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/route 1.jpg",)
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(featuredCourse .title??"",style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 18),),
            SizedBox(height: 3,),

            Text(" ${featuredCourse.numberOfStudents} studentEnrolled",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 14),),
            SizedBox(height: 3,),
            ElevatedButton(
                style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryLightColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                ),
                // ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColorLight),
                onPressed:  (){},
                child: Text("Enroll Now",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}