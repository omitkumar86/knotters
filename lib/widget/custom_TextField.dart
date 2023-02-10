import 'package:flutter/material.dart';
import 'package:knotters/widget/const.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField(
      {super.key,
      required this.emailController,
      this.validator,
      this.hintText,
      this.keyType,
      this.focusNode,
      this.prefixIcon,
      this.onEditingComplete,
      this.maxNumber,
      this.minNumber,
      this.suffixIcon,
      this.initialText,
      this.isObsecure,
      this.textInputAction,
      this.formatter,
      this.onChangeFunction});

  final TextEditingController emailController;
  final String? hintText, initialText;
  final TextInputType? keyType;
  final dynamic validator, formatter;
  final dynamic prefixIcon;
  final FocusNode? focusNode;
  final dynamic suffixIcon;
  final Function? onChangeFunction;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final int? maxNumber, minNumber;
  final bool? isObsecure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      autofocus: false,
      maxLines: maxNumber ?? 1,
      initialValue: initialText,
      textInputAction: textInputAction,
      focusNode: focusNode,
      inputFormatters: formatter,
      keyboardType: keyType,
      validator: validator,
      controller: emailController,
      obscureText: isObsecure ?? false,
      style: myStyle(14.0, Colors.black54),
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        focusedErrorBorder: InputBorder.none,
        hoverColor: Colors.black,
        filled: true,
        errorBorder: InputBorder.none,
        // suffixText: suffixText,
        errorStyle:
            myStyle(12, Colors.redAccent.withOpacity(0.9), FontWeight.w500),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
          borderRadius: BorderRadius.circular(12.0),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 2.0,
          ),
        ),
        labelText: hintText,
        hintStyle: myStyle(12, Colors.black54),
        prefixIcon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: buttonBackgroundColor,
            ),
            margin: EdgeInsets.only(left: 12, right: 10),
            child: prefixIcon),
        labelStyle: myStyle(12, Colors.black54),
        hintText: hintText,
      ),
    );
  }
}

class CustomeTextField2 extends StatelessWidget {
  const CustomeTextField2(
      {super.key,
      required this.controller,
      this.validator,
      this.hintText,
      this.keyType,
      this.prefixIcon,
      this.onEditingComplete,
      this.focusNode,
      this.onTap,
      this.maxLine,
      this.textInputAction,
      this.onChangeFunction});

  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyType;
  final dynamic validator;
  final dynamic prefixIcon;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final Function? onChangeFunction;
  final VoidCallback? onEditingComplete;
  final int? maxLine;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        focusNode: focusNode,
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        onTap: onTap,
        keyboardType: keyType,
        validator: validator,
       // maxLines: maxLine ?? 1,
        controller: controller,
        style: myStyle(14.0, Colors.black54),
        decoration: InputDecoration(
          errorStyle: myStyle(12, primaryColor),
          border: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: "$hintText",
          hintStyle: myStyle(14, textColorLight),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ));
  }
}
/*
class CustomePasswordTextField extends StatelessWidget {
  CustomePasswordTextField(
      {super.key,
      required this.controller,
      this.validator,
      this.hintText,
      this.keyType,
      this.prefixIcon,
      this.boarderColor,
      this.suffixIcon,
      required this.isObsecure,
      this.focusNode,
      this.onEditingComplete,this.maxLine,
      this.textInputAction,
      this.onChangeFunction});

  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyType;
  final dynamic validator;
  final dynamic prefixIcon;
  final dynamic suffixIcon;
  final FocusNode? focusNode;
  final Function? onChangeFunction;
  final VoidCallback? onEditingComplete;
  bool isObsecure = false;  final int? maxLine;
  final TextInputAction? textInputAction;
  final Color? boarderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField( minLines: 1,
        autofocus: false, maxLines: maxLine ?? 1,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        textInputAction: textInputAction,
        validator: validator,
        obscureText: isObsecure!,
        controller: controller,
        style: myStyle(14.0, Colors.black54),
        decoration: InputDecoration(
          errorStyle: myStyle(12, primaryColor),
          //errorText: "kjsdfbj",
          border: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hintText ?? "Enter your password",
          suffixIcon: suffixIcon,
          hintStyle: myStyle(14, textColorLight),

          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          prefixIcon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: buttonBackgroundColor,
            ),
            margin: EdgeInsets.only(left: 12, right: 10),
            child: Icon(
              Icons.lock_outline_rounded,
              color: textColorLight,
              size: 18,
            ),
          ),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: boarderColor == null ? Colors.transparent : primaryColor,
              width: 1,
            ),
          ),
        )
    );
  }
}*/
