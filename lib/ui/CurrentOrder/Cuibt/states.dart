import 'package:mohamed/Model/AcceptResponse.dart';
import 'package:mohamed/Model/CanceledOrederResponse.dart';
import 'package:mohamed/Model/CanceledResponse.dart';
import 'package:mohamed/Model/CompledtedOrderResponse.dart';
import 'package:mohamed/Model/CurrentResponse.dart';
import 'package:mohamed/Model/DeledateResponse.dart';
import 'package:mohamed/Model/IncompleteOrderResponse.dart';
import 'package:mohamed/Model/LanguageResponse.dart';
import 'package:mohamed/Model/OrderlResponse.dart';

abstract class CurrentState {}
class CurrentInittalState extends CurrentState {}
class CurrentLoadingState extends CurrentState {}
class CurrentSucessState extends CurrentState {
  final CurrentResponse currentResponse;

  CurrentSucessState(this.currentResponse);
}
class CurrentErrorState extends CurrentState {

}
class CanceledInittalState extends CurrentState {}
class CanceledLoadingState extends CurrentState {}
class CanceledSucessState extends CurrentState {
  final CanceledOrederResponse canceledOrederResponse;
  CanceledSucessState(this.canceledOrederResponse);
}
class CanceledErrorState extends CurrentState {

}

class IncompleteInittalState extends CurrentState {}
class IncompleteLoadingState extends CurrentState {}
class IncompleteSucessState extends CurrentState {
  final IncompleteOrderResponse incompleteOrderResponse;
  IncompleteSucessState(this.incompleteOrderResponse);
}
class IncompleteErrorState extends CurrentState {

}

class DelegateInittalState extends CurrentState {}
class DelegateLoadingState extends CurrentState {}
class DelegateSucessState extends CurrentState {
  final DeledateResponse deledateResponse;
  DelegateSucessState(this.deledateResponse);
}
class DelegateErrorState extends CurrentState {

}
class CompleteInittalState extends CurrentState {}
class CompleteLoadingState extends CurrentState {}
class CompleteSucessState extends CurrentState {
  final CompledtedOrderResponse compledtedOrderResponse;
  CompleteSucessState(this.compledtedOrderResponse);
}
class CompleteErrorState extends CurrentState {
}


class CurrentOrderInittalState extends CurrentState {}

class CurrentOrderLoadingState extends CurrentState {}

class CurrentOrderSucessState extends CurrentState {
  final CurrentOrderResponse currentOrderResponse ;
  CurrentOrderSucessState(this.currentOrderResponse);
}
class  CurrentOrderErrorState extends CurrentState{}

class AcceptInitial extends CurrentState {}
class  AcceptLoading extends CurrentState {}
class  AcceptSuccess extends CurrentState {
  final AcceptResponse acceptResponse;
  AcceptSuccess(this.acceptResponse);
}
class  AcceptError extends CurrentState {
  final String error;
  AcceptError(this.error);
}
class CanceledInitial extends CurrentState {}
class  CanceledLoading extends CurrentState {}
class  CanceledSuccess extends CurrentState {
  final CanceledResponse canceledResponse;
  CanceledSuccess(this.canceledResponse);
}
class  CanceledError extends CurrentState {
  final String error;
  CanceledError(this.error);
}
class LanguageInitial extends CurrentState {}
class  LanguageLoading extends CurrentState {}
class   LanguageSuccess extends CurrentState {
  final LanguageResponse languageResponse;
  LanguageSuccess(this.languageResponse);
}
class   LanguageError extends CurrentState {
  final String error;
  LanguageError(this.error);
}











