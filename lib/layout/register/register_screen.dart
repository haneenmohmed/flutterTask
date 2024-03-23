import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart.';
import 'package:flutter_task/layout/home/home_screen.dart';
import 'package:flutter_task/layout/login/login_screen.dart';
import 'package:flutter_task/shared/dialog_utils.dart';

import '../../shared/firebaseautherrorcodes.dart';
import '../../shared/reuseable_components/custom_form_field.dart';
import '../../style/appcolors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "/register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObscured = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Padding
        (padding:EdgeInsets.all(16) ,
        child: Form(
            key: formKey ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 8 ,vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Image.asset(
              'assets/images/routelogo1.jpg',
              width: 129,
              height: 45.59,),
                Image.asset(
                  'assets/images/darkmoodicon.jpg',
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ),
            SizedBox(height: 20),
            Padding(
                padding:EdgeInsets.only(left: 20),
              child:  Text(
                'Create an account',
                textAlign: TextAlign.start,
                style:Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(height: 0.5),
            Padding(
                padding:EdgeInsets.only(left: 20),
                child: Text(
                  'Connect with your friends today!',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
            ),
            SizedBox(height: 20),
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 15),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                    //  CustomFormField(
                    //    controller: fullNameController,
                    //    label: 'FUll Name',
                    //    hintText: "please enter yor Name",
                    //    keyboardType: TextInputType.name,
                    //    validator: (value) {
                    //      if (value == null || value.isEmpty) {
                    //      return 'Please enter your name ';
                    //        }
                    //        return null;
                    //          },
                    //              ) ,
                    // SizedBox(height: 20,),
                 CustomFormField(
                   controller: emailController,

                   label: 'Email',
                   hintText: "please enter yor email !",
                   keyboardType: TextInputType.emailAddress,
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Please enter your email';
                     }
                     return null;
                   },
                 ),
                 SizedBox(height: 20),
                 CustomFormField(
                   controller: passwordController,
                   label: 'Password',
                   hintText: "please enter yor password !",
                   keyboardType: TextInputType.visiblePassword,
                   obscureText: true,
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Please enter your password';
                     }
                     return null;
                   },
                 ),
             SizedBox(height: 20),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: () {
                     createNewUser() ;

                 },

                 style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryLightColor),
                   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(15)), // Set padding
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                     RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),
                     ),

                   ),
                 ),
                 child: Text('SignUp' ,
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 17,
                       fontWeight: FontWeight.w400
                   ),),

               ),
             ),
             SizedBox(height: 10),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                   'Already have an account ?',
                   style: TextStyle(
                     color: AppColors.textfieldcolor,
                   ),
                 ),
                 GestureDetector(
                   onTap: () {
                     Navigator.pushNamed(context, LoginScreen.routeName);

                   },
                   child: Text(
                     'Login',
                     style: TextStyle(
                         color: AppColors.primaryLightColor
                     ),
                   ),
                 ),
               ],

             )
            ,

          ],


           ))])),


    ));
}

///// fun register
    Future<void> createNewUser() async {
    if(formKey.currentState?.validate()??false){
      DialogUtils.showLoadingDialog(context);
 try{   UserCredential credential =  await  FirebaseAuth.instance.createUserWithEmailAndPassword(
     email: emailController.text,
     password: passwordController.text);
   DialogUtils.hideLoadingDialog(context);
    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);

 DialogUtils.ShowMessage(
     context: context, message: "Registered successfully ${credential.user?.uid}",
     positiveText: "ok",
     positivePress: () {
       DialogUtils.hideLoadingDialog(context);
     });

 print(credential.user?.uid);

    } on FirebaseAuthException catch (e) {
   DialogUtils.hideLoadingDialog(context);
   DialogUtils.ShowMessage(context: context, message: "The password provided is too weak" ,
   positiveText: "ok",
       positivePress:(){ DialogUtils.hideLoadingDialog(context); });
   if (e.code == FirebaseAuthErrorCodes.weakPassword) {
     print('The password provided is too weak.');
   } else if (e.code ==  FirebaseAuthErrorCodes.emailAlreadyInUse) {
     DialogUtils.ShowMessage(
         context: context, message: "The account already exists for that email",
         positiveText: "ok",
         positivePress: () {
           DialogUtils.hideLoadingDialog(context);
         });
     print('The account already exists for that email.');
   }}catch (e){
   DialogUtils.hideLoadingDialog(context);
   DialogUtils.ShowMessage(
       context: context, message: e.toString(),
       positiveText: "ok",
       positivePress: () {
         DialogUtils.hideLoadingDialog(context);
       });
    }
}}}
