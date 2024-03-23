import 'package:flutter/material.dart';
import 'package:flutter_task/style/appcolors.dart';
import '../../firebase/firestore_helper.dart';
import '../../model/Best_Selling.dart';
import '../../model/FeaturedCourses.dart';
import '../login/login_screen.dart';
import 'BestSellingCourses.dart';
import 'Featured_Courses.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          leading: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Route',
                  style: Theme.of(context).textTheme.titleLarge
                  ,
                ),
              ),
              SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welocme to Route',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Enjoy our courses',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.dark_mode),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // First section: Featured courses
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Featured',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: ' Courses',
                        style: TextStyle(color: AppColors.primaryLightColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                StreamBuilder(
                  stream: FireStoreHelper.ListenToFeaturedCourses(),
                  builder: (BuildContext context, snapshot) {
                    List<FeaturedCourses> AllFeatureCourse = snapshot.data ?? [];
                    return Container(
                      height: 250,
                      child: ListView.separated(
                        itemBuilder: (context, index) => FeaturedCoursesWidget(featuredCourse: AllFeatureCourse[index]),
                        separatorBuilder: (context, index) => Container(width: 10),
                        itemCount: AllFeatureCourse.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Second section: Best selling courses
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Best Selling',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: ' Courses',
                                style: TextStyle(color: AppColors.primaryLightColor),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // View more action
                          },
                          child: Text(
                            'View More',
                            style: TextStyle(
                              color: AppColors.primaryLightColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    StreamBuilder(
                      stream: FireStoreHelper.ListenToBestCourses(),
                      builder: (context, snapshot) {
                        List<BestSellingCourses> AllBestCourses = snapshot.data ?? [];
                        return Container(
                          height: 360,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => BestSellingWidget(bestSellingCourse: AllBestCourses[index]),
                            separatorBuilder: (context, index) => Container(
                              height: 25,
                            ),
                            itemCount: AllBestCourses.length,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );}}
