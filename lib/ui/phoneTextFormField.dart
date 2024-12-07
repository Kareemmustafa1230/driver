import 'package:flutter/material.dart';

// ignore: must_be_immutable
class  PhoneTextFormField extends StatelessWidget {
  String? Function(String?)? validator;
  TextEditingController controller ;
  PhoneTextFormField({super.key, required this.validator,required this.controller});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SizedBox(
      width: size.width * 0.685,
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            child: const Text('phone number',
                style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),topRight: Radius.circular(5)),
            borderSide: BorderSide(
              color: Color(0xFFCED5E1),
              width: 2,
            ),
          ),
          focusedBorder:  const OutlineInputBorder(
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
