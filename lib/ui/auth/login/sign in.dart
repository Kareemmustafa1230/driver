import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/ui/DialogUtils.dart';
import 'package:mohamed/ui/Email.dart';
import 'package:mohamed/ui/Order%20management.dart';
import 'package:mohamed/ui/Password.dart';
import 'package:mohamed/ui/SharedPreference.dart';
import 'package:mohamed/ui/auth/login/cubit/Sing-state.dart';
import 'package:mohamed/ui/auth/login/cubit/singInViewModel.dart';

class SignIn extends StatelessWidget {
  static const String routeName = 'Sign-In';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SingInViewModel(),
      child: BlocConsumer<SingInViewModel, LodinState>(
        listener: (context, state) {
          if (state is LoginError) {
            DialogUtils.showLoading(context, state.error!);
          }
          if (state is LoginSuccess) {
            SharedPreferenceUtils.saveData(
                key: "token", value: state.logingResponse.token);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Ordermanagement();
                },
              ),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          var cubit = SingInViewModel.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              backgroundColor: const Color(0xFF7785DB),
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.1),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Hello again!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF888888),
                    ),
                  ),
                ),
                Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.035),
                      Padding(
                        padding: const EdgeInsets.only(left: 19),
                        child: Email(
                          controller: cubit.emailContriller,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'please enter email';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.035),
                      Padding(
                        padding: const EdgeInsets.only(left: 19),
                        child: Password(
                          item: 'Password',
                          controller: cubit.passwordController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'please enter your  password';
                            }
                            if (value.trim().length < 8 ||
                                value.trim().length > 30) {
                              return 'password should be >8 & <30';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.055),
                (state is LoginLoading)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            cubit.getLogin(
                                email: cubit.emailContriller.text,
                                password: cubit.passwordController.text);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF7785DB),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: size.height * 0.058,
                            alignment: Alignment.center,
                            width: size.width * 0.885,
                            child: const Text(
                              'Sign IN',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
