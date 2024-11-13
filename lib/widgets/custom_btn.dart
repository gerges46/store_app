import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({this.onTap,super.key, required this.text});
final String text;
VoidCallback ?onTap; 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
            width: double.infinity,
            height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12)
          ),
          child:   Center(child: Text(text,style: const TextStyle(color: Colors.white),)),
           ),
    );
  }
}