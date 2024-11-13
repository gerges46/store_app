
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
 CustomTextFormField({
    this.onChanged, 
    this.hint, 
    this.suffixIcon, 
    super.key,
    this.isSeen=false,
    this.textInputType,
  });

  final String? hint;
  TextInputType ?textInputType;
  bool isSeen ;
  final Function(String)? onChanged;
  final Widget? suffixIcon;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(

   /*    validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
        return null;
      }, */
      obscureText: widget.isSeen,
      onChanged: widget.onChanged,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        suffixIcon:widget.suffixIcon,
        hintText: widget.hint,
      //  hintStyle: const TextStyle(color: Colors.white),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            
            color: Colors.grey,
          ),
        ),
        border:  OutlineInputBorder(
               borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            //color: Colors.white,
          ),
        ),
      ),
    );
  }
}

