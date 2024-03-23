import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/style/appcolors.dart';
import 'package:flutter_task/style/theme.dart';

typedef FieldValidation = String? Function(String?)?;

class CustomFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FieldValidation validator;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? hintText;
  final double? height;

  CustomFormField({
    Key? key,
    required this.label,
    required this.controller,
    required this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.hintText,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 39,
          child: TextFormField(
            validator: validator,
            keyboardType: keyboardType,
            obscureText: obscureText,
            controller: controller,
            style: TextStyle(color: Colors.black, fontSize: 16),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color:AppColors.textfieldcolorinput,
              fontSize: 14 ,
              fontWeight: FontWeight.w300),

              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.textfieldcolor),
                borderRadius: BorderRadius.circular(8)
                ,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:AppColors.textfieldcolor),
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
