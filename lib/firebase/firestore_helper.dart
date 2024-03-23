

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/Best_Selling.dart';
import '../model/FeaturedCourses.dart';

class FireStoreHelper{

  static CollectionReference<FeaturedCourses> getCourseCollection(){
    var reference=FirebaseFirestore.instance.collection("FeaturedCourses").withConverter(
        fromFirestore:(snapshot,option){
          Map<String,dynamic>?data=snapshot.data();
          return FeaturedCourses.fromFireStore( data??{});
        }  ,
        toFirestore:  (FeaturedCourses,options){
          return FeaturedCourses.toFireStore();
        });
    return reference;
  }

  static  Stream<List<FeaturedCourses>> ListenToFeaturedCourses( )async*{
    var featuredCourseQueryStream=getCourseCollection( ).snapshots();
    Stream<List<FeaturedCourses>>FeatureCourseStream=featuredCourseQueryStream.map((querySnapshot) => querySnapshot.docs.map((document) => document.data()).toList() );
    yield* FeatureCourseStream;
   // pauses the execution of the function

  }

  static CollectionReference<BestSellingCourses> getBestCourseCollection(){
    var reference=FirebaseFirestore.instance.collection("BestSellingCourses").withConverter(
        fromFirestore:(snapshot,option){
          Map<String,dynamic>?data=snapshot.data();
          return BestSellingCourses.fromFireStore( data??{});
        }  ,
        toFirestore:  (BestSellingCourses,options){
          return BestSellingCourses.toFireStore();
        });
    return reference;
  }

  static  Stream<List<BestSellingCourses>> ListenToBestCourses( )async*{
    var BestCourseQueryStream=getBestCourseCollection( ).snapshots();
    Stream<List<BestSellingCourses>>BestCourseStream=BestCourseQueryStream.map((querySnapshot) => querySnapshot.docs.map((document) => document.data()).toList() );
    yield* BestCourseStream; //zy al return

  }




}