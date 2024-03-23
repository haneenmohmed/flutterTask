class BestSellingCourses{
  String? title;
  int? numberOfStudents;
  BestSellingCourses({required this.title,required this.numberOfStudents});

  BestSellingCourses.fromFireStore(Map<String,dynamic> data){
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