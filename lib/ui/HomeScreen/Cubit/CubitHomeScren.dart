import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/Model/OrderlResponse.dart';
import 'package:mohamed/ui/CurrentOrder/current%20requests.dart';
import 'package:mohamed/ui/HomeScreen/Cubit/state.dart';

import '../../Canceled orders.dart';
import '../../Completed orders.dart';
import '../../Requests incomplete.dart';
import '../../Settings.dart';

class HomeScreenViewModel extends Cubit<HomeStates>{
  HomeScreenViewModel():super(HomeInitialStates());
  Product? product ;
  int selectedIndex = 0 ;
  List<Widget> taps = [
    Settings(), CanceledOrders(),RequestsIncomplete(),CompletedOrders(),CurrentRequests(),
  ];
void changeBottomNavIndex(int newSelectedIndex){
  HomeInitialStates;
  selectedIndex = newSelectedIndex ;
  emit(HomeChangeBottomNavBar());
}
}