import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/ui/HomeScreen/Cubit/CubitHomeScren.dart';
import 'package:mohamed/ui/HomeScreen/Cubit/state.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home-Screen';
  HomeScreenViewModel viewModel = HomeScreenViewModel();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeScreenViewModel,HomeStates>(
      bloc: viewModel,
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            selectedItemColor: Color(0xFF7785DB),
            unselectedItemColor: Color(0xFFC7C7C7),
            currentIndex:viewModel.selectedIndex,
            onTap: (index){
              viewModel.changeBottomNavIndex(index) ;
            },
            iconSize: 32,
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/ant-design_setting-filled.png'),
                ),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/7Layer_1 (1).png'),
                ),
                label: 'Canceled orders',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/6Layer_1 (1).png'),
                ),
                label: 'Requests incomplete',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/0Layer_1 (1).png'),
                ),
                label: 'Completed Orders',
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/5Layer_1 (1).png'),
                  ),
                  label: 'current Orders'
              ),
            ],
          ),
          body:viewModel.taps[viewModel.selectedIndex],
        );
      },
    );
  }
}


