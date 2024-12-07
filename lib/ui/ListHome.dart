import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListHome extends StatelessWidget {
 String image ;
 String text ;
 String number ;
 int back ;
 int styel ;
 double num1;
 double num2;
 String pushName;
 ListHome({super.key, required this.text,required this.number,required this.image,required this.back,required this.styel,
 required this.num1,required this.num2,required this.pushName
 });
 @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, pushName);
      },
      child: Card(
        color: const Color(0xFFFAFBFF),
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
                child: Container(
                  width: size.width * 0.071,
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
                        fontWeight: FontWeight.w500,
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
                  style: const TextStyle(
                    fontSize: 16,
                      fontWeight: FontWeight.w500,
                    color: Color(0xFF7785DB),
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
