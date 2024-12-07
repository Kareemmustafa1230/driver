import 'package:mohamed/Model/LogingResponse.dart';

abstract class LodinState {}

class LodinInitial extends LodinState {}

class LoginLoading extends LodinState {}
class LoginSuccess extends LodinState {
  final LogingResponse logingResponse;
  LoginSuccess(this.logingResponse);
}
class LoginError extends LodinState {
  final String error;
  LoginError(this.error);
}



