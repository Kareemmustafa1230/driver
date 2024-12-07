import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListHomeCurrentOrder extends StatelessWidget {
  String image ;
  String text ;
  String number ;
  int back ;
  int styel ;
  double num1;
  double num2;
  String pushName;
  ListHomeCurrentOrder({required this.text,required this.number,required this.image,required this.back,required this.styel,
    required this.num1,required this.num2,required this.pushName
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(pushName);
      },
      child: Card(
        color: Color(0xFFFAFBFF),
        elevation: 1,
        child: Container(
          height: size.height * num1,
          width: size.width * num2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.width *0.045),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: DottedBorder(
                  color: Color(0xFF7785DB),
                  borderType: BorderType.Circle,
                  radius: Radius.circular(20),
                  child: Container(
                    width: size.width * 0.065,
                    height: size.height * 0.034,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(back ),
                    ),
                    alignment: Alignment.center,
                    child: Text(number,
                      style: TextStyle(
                          color: Color(styel),
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: Image.asset(image)),
              SizedBox(height: size.height * 0.01),
              Center(
                child: Text(text,
                  style:TextStyle
                    (color: Color(0xFF7785DB),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
