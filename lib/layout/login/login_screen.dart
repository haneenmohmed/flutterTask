import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/shared/dialog_utils.dart';
import 'package:flutter_task/shared/firebaseautherrorcodes.dart';
// import 'package:flutter_task/style/appcolors.dart';
import 'package:flutter_task/style/theme.dart';

import '../../shared/reuseable_components/custom_form_field.dart';
import '../../style/appcolors.dart';
import '../home/home_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String routeName = "/Login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscured = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child:
          Column(
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
                      height: 45.59,
                    ),
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
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Hi, Wecome Back! ',
                  textAlign: TextAlign.start,
                  style:Theme.of(context).textTheme.titleLarge,
                  // AppTheme.lightTheme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 0.5),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Hello again, you’ve been missed!',
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
                          Login();
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
                        child: Text('Login' ,
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
                          'Don\'t have an account? ',
                          style: TextStyle(
                            color: AppColors.textfieldcolor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.routeName);

                          },
                          child: Text(
                            'Sign up here',
                            style: TextStyle(
                              color: AppColors.primaryLightColor
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> Login() async {
      if(formKey.currentState?.validate()??false){
        DialogUtils.showLoadingDialog(context);
    try{
    UserCredential credential =  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text,
        password: passwordController.text);

    DialogUtils.hideLoadingDialog(context);
    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);

    print("user id :${credential.user?.uid}");
    }on FirebaseAuthException catch(error){
      DialogUtils.hideLoadingDialog(context);
    if(error.code==FirebaseAuthErrorCodes.userNotFound){
    print("user not found");
    DialogUtils.ShowMessage(context: context, message:"user not found",
    positiveText: "Ok" ,
    positivePress: (){
      Navigator.pop(context);
    });
    }else if (error.code == FirebaseAuthErrorCodes.wrongPassword){
    print("Wrong Password");}
      DialogUtils.ShowMessage(context: context, message:"Wrong Password",
          positiveText: "Ok" ,
          positivePress: (){
            Navigator.pop(context);
          });
    }}}
  }
