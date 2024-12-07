import 'package:flutter/material.dart';

class NumberPhone extends StatelessWidget {
  String? Function(String?)? validator;
  TextEditingController controller ;
  NumberPhone({super.key, required this.controller,required this.validator});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.2,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          label: Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: const Text('+964',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF262626),
              ),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5)),
            borderSide: BorderSide(
              color: Color(0xFFCED5E1),
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5)),
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