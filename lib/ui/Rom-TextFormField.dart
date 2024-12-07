import 'package:flutter/material.dart';

class CustumTextFormField extends StatelessWidget {
  String hintext;
  String? Function(String?)? validator;
  TextEditingController controller ;
  CustumTextFormField({super.key, required this.hintext , this.validator,required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.41,
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          label: Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            child: Text(
              hintext,
              style: const TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: Color(0xFFCED5E1),
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
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
