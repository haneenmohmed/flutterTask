import 'package:cloud_firestore/cloud_firestore.dart';

class FeaturedCourses{
  String? title;
  int? numberOfStudents;
  FeaturedCourses({required this.title,required this.numberOfStudents});

  FeaturedCourses.fromFireStore(Map<String,dynamic> data){
    title=data["title"];
    numberOfStudents=data["numberOfStudents"];
  }
  Map<String,dynamic> toFireStore(){
    Map<String,dynamic>data={
      "title":title,
      "numberOfStudents":numberOfStudents,

    };
    return data;
  }


}