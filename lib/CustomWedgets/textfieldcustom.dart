import 'package:flutter/material.dart';
import 'package:weatherapplication/Models/authmodel.dart';

class Textfieldcustom extends StatelessWidget 
{
  final String lable;
  final Icon prefixicon;
   Icon ?sufixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  Textfieldcustom({super.key, required this.controller,required this.lable, required this.prefixicon, this.validator, this.sufixIcon});

  @override
  Widget build(BuildContext context)
   {
    return SizedBox(
      width: 350,
      child: Card(
        elevation: 10,
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            label: Text(lable,style: TextStyle(fontSize: 20,color: Colors.black),),
            prefixIcon: prefixicon,
            suffixIcon: sufixIcon,
            filled: true,
            fillColor: const Color.fromARGB(255, 208, 161, 202),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}