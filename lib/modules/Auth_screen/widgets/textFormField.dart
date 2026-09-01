import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Textformfield extends StatelessWidget{
  String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Textformfield({super.key,required this.hintText,this.prefixIcon,this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    final _textController=TextEditingController();

    return TextFormField(

      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        filled: true,
        fillColor: const Color(0xFF282A28),
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: Color(0xFF282A28)
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0xFF282A28),
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Color(0xFF282A28),
            )
        ),
      ),
    );
  }

}