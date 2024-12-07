import 'package:flutter/material.dart';
import 'package:mohamed/ui/auth/login/sign%20in.dart';

// ignore: camel_case_types
class language extends StatelessWidget {
  static const String routeName = 'language';

  const language({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF7785DB),
        title: const Text('اللغة',
          style:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
         backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             SizedBox(height: size.height * 0.265),
              const Text('إختر اللغة',
                style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7785DB),
                ),
              ),
              SizedBox( height:size.height * 0.032),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(SignIn.routeName);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF7785DB),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: size.width * 0.581,
                  height: size.height * 0.058,
                  alignment: Alignment.center,
                  child: const Text('العربية',
                    style:TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              const SizedBox(height:24 ),
              InkWell(
                onTap: (){
                      Navigator.of(context).pushNamed(SignIn.routeName);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF7785DB),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: size.height * 0.058,
                  width: size.width * 0.581,
                  alignment: Alignment.center,
                  child: const Text('English',
                    style:TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                    ),
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
