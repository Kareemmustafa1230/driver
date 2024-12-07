import 'package:flutter/material.dart';

class CodeTextFormField extends StatelessWidget {
  static const String routeName = 'Code-Reset-password';

  const CodeTextFormField({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.188,
      child: TextFormField(
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: Color(0xFFCED5E1),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: Color(0xFFCED5E1),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
