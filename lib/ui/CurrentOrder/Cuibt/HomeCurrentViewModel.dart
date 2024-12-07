import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/Model/AcceptResponse.dart';
import 'package:mohamed/Model/CanceledOrederResponse.dart';
import 'package:mohamed/Model/CanceledResponse.dart';
import 'package:mohamed/Model/CompledtedOrderResponse.dart';
import 'package:mohamed/Model/CurrentResponse.dart';
import 'package:mohamed/Model/DeledateResponse.dart';
import 'package:mohamed/Model/IncompleteOrderResponse.dart';
import 'package:mohamed/Model/LanguageResponse.dart';
import 'package:mohamed/Model/OrderlResponse.dart';
import 'package:mohamed/data/Api/const.dart';
import 'package:mohamed/data/Api/dio.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/states.dart';
import 'package:mohamed/ui/SharedPreference.dart';

class HomeCurrentViewModel extends Cubit<CurrentState> {
  HomeCurrentViewModel() : super(CurrentInittalState());

  static HomeCurrentViewModel get(context) => BlocProvider.of(context);

  void getLanguage({required String locale}) {
    emit(LanguageLoading());
    DioFinalHelper.getData(
      endPointName: current,
    ).then((value) {
      emit(LanguageSuccess(LanguageResponse.fromJson(value.data)));
    }).catchError((e) {
      print(e.toString());
      emit(LanguageError('An error occurred: $e'));
    });
  }
  void getCurrent() {
    emit(CurrentLoadingState());
    DioFinalHelper.getData(
      endPointName: current,
    ).then((value) {
      emit(CurrentSucessState(CurrentResponse.fromJson(value.data)));
    }).catchError((e) {
      print(e.toString());
      emit(CurrentErrorState());
    });
  }

  void getCancled() {
    emit(CanceledLoadingState());
    DioFinalHelper.getData(
      endPointName: canceled,
    ).then((value) {
      emit(CanceledSucessState(CanceledOrederResponse.fromJson(value.data)));
    }).catchError((e) {
      print(e.toString());
      emit(CanceledErrorState());
    });
  }

  void getIncomplte() {
    emit(IncompleteLoadingState());
    DioFinalHelper.getIncompleteData(
      endPointName: incomplete,
    ).then((value) {
      emit(IncompleteSucessState(IncompleteOrderResponse.fromJson(value.data)));
    }).catchError((e) {
      print(e.toString());
      emit(IncompleteErrorState());
    });
  }

  void getDelegate() {
    emit(DelegateLoadingState());
    DioFinalHelper.getData(
      endPointName: delegate,
    ).then((value) {
      emit(DelegateSucessState(DeledateResponse.fromJson(value.data)));
    }).catchError((e) {
      print(e.toString());
      emit(IncompleteErrorState());
    });
  }

  void getComplte() {
    emit(CompleteLoadingState());
    DioFinalHelper.getData(
      endPointName: complete,
    ).then((value) {
      emit(CompleteSucessState(CompledtedOrderResponse.fromJson(value.data)));
    }).catchError((e) {
      print(e.toString());
      emit(CompleteErrorState());
    });
  }

  void getFistData({required int id}) {
    emit(CurrentOrderLoadingState());
    DioFinalHelper.getData(
      endPointName: orderDetails(id),
    ).then((value) {
      emit(CurrentOrderSucessState(CurrentOrderResponse.fromJson(value.data)));
    }).catchError((e) {
      print(e.toString());
      emit(CurrentOrderErrorState());
    });
  }

  Future<void> postAccept({required int id}) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SharedPreferenceUtils.getData(key: 'token')}',
      };
      var dio = Dio();
      var response = await dio.post(
        'https://stor.testm.online/api/Accept_Order/$id',
        options: Options(
          headers: headers,
        ),
      );
      emit(AcceptLoading());
      if (response.statusCode == 200) {
        emit(AcceptSuccess(AcceptResponse.fromJson(response.data)));
        print(json.encode(response.data));
      } else {
        emit(AcceptError(
            'Failed to accept. Status code: ${response.statusCode}'));
        print(response.statusMessage);
      }
    } catch (e) {
      print('Error: $e');
      emit(AcceptError('An error occurred: $e'));
    }
  }

  Future<void> postCanceled({required int id}) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SharedPreferenceUtils.getData(key: 'token')}',
      };

      var data = FormData.fromMap({
        'declineReason': 'sdgsdgsdg',
      });

      var dio = Dio();
      var response = await dio.post(
        'https://stor.testm.online/api/Cancel_Order/$id',
        options: Options(headers: headers,),
        data: data,
      );

      emit(CanceledLoading());

      if (response.statusCode == 200) {
        emit(CanceledSuccess(CanceledResponse.fromJson(response.data)));
        print(json.encode(response.data));
      } else {
        emit(CanceledError(
            'Failed to cancel. Status code: ${response.statusCode}'));
        print(response.statusMessage);
      }
    } catch (e) {
      print('Error: $e');
      emit(CanceledError('An error occurred: $e'));
    }
  }
}
