import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  String? Function(String?)? validator;
  TextEditingController controller ;
  Email({super.key,  this.validator,required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.885,
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          label: Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            child: const Text('E-mail',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color:Color(0xFF888888),
                fontSize: 14,
              ),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius:  BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: Color(0xFFCED5E1),
              width: 2,
            ),
          ),
          focusedBorder:  const OutlineInputBorder(
            borderRadius:  BorderRadius.all(Radius.circular(5)),
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
