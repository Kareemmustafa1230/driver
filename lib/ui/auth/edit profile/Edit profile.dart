import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohamed/ui/Email.dart';
import 'package:mohamed/ui/Password.dart';
import 'package:mohamed/ui/Rom-TextFormField.dart';
import 'package:mohamed/ui/auth/login/sign%20in.dart';
import 'package:mohamed/ui/numberPhone.dart';
import 'package:mohamed/ui/phoneTextFormField.dart';
class EditProfile extends StatelessWidget {
  static const String routeName = 'Edit-Profile';
  var foreKey = GlobalKey<FormState>();
  var firstController = TextEditingController();
  var secondController = TextEditingController();
  var emailController = TextEditingController();
  var constphoneController = TextEditingController();
  var passwordController = TextEditingController();
  var repasswordController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7785DB),
         title: Text('Edit profile',
           style: TextStyle(
             color: Colors.white,
             fontSize: 20,
             fontWeight: FontWeight.w500,
           ),
         ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 20),
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 84),
              Padding(
                padding: EdgeInsets.only(bottom:16 ),
                child: Row(
                  children: [
                    Text('First Name',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF262626)
                      ),
                    ),
                    SizedBox(width: 120),
                    Text('Family Name',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF262626)
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: foreKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustumTextFormField( hintext: 'First Name',controller: firstController,validator: (value){
                          if(value == null || value.trim().isEmpty){
                            return 'please enter your First Name ';
                          }
                          return null;
                        },),
                        SizedBox(width: 25),
                        CustumTextFormField(hintext: 'Family Name',controller: secondController,validator: (value){
                          if(value == null || value.trim().isEmpty){
                            return 'please enter your Family Name ';
                          }
                          return null;
                        },),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 16),
                      child: Text('phone number',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF262626)
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        NumberPhone(controller:constphoneController,validator: (value){}, ),
                        PhoneTextFormField(controller: phoneController,validator:(value){
                          if(value == null || value.trim().isEmpty){
                            return 'please enter your NumberPhone ';
                          }
                          return null;
                        }, ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 16),
                      child: Text('E-mail',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF262626)
                        ),
                      ),
                    ),
                    Email(controller: emailController,validator: (value){
                      if(value == null || value.trim().isEmpty){
                        return 'please enter your eamil ';
                      }
                      return null;
                    },),
                    SizedBox(height: size.height * 0.03),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 16),
                      child: Text('Password',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF262626)
                        ),
                      ),
                    ),
                    Password(item: 'Password',controller: passwordController,validator: (value){
                      if(value == null || value.trim().isEmpty){
                        return 'please enter your  password';
                      }
                      if(value.trim().length < 8 || value.trim().length > 30){
                        return 'password should be >8 & <30';
                      }
                      return null;
                    },),
                    SizedBox(height: size.width * 0.11),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(SignIn.routeName);
                      },
                      child: Padding(
                        padding:  EdgeInsets.only(left: 66),
                        child: Container(
                          alignment: Alignment.center,
                          height:45,
                          decoration: BoxDecoration(
                              color: Color(0xFF7785DB),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          width: 212,
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
