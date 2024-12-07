import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/Model/LogingResponse.dart';
import 'package:mohamed/data/Api/const.dart';
import 'package:mohamed/data/Api/dio.dart';
import 'package:mohamed/ui/auth/login/cubit/Sing-state.dart';

class SingInViewModel extends Cubit<LodinState>{
  SingInViewModel():super(LodinInitial());
  var formKey = GlobalKey<FormState>();
  var emailContriller = TextEditingController();
  var passwordController = TextEditingController();
  static SingInViewModel get(context) => BlocProvider.of(context);

  Future getLogin({
    required String email,
    required String password,

  }) async {
    emit(LoginLoading());
    DioFinalHelper.postData(
      endPointName: login,
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      emit(LoginSuccess(LogingResponse.fromJson(value.data)));
    }).catchError((e){
      print(e.toString());
      emit(LoginError(e.toString()));
    });
  }
}


