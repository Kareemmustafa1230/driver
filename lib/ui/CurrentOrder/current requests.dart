import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/Model/CurrentResponse.dart';
import 'package:mohamed/ui/ChackCode.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/HomeCurrentViewModel.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/states.dart';

import '../ListOfCurrentRequests.dart';

class CurrentRequests extends StatelessWidget {

  static const String routeName = 'current-Requests';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<CurrentData> CurrentdataList = [];
    return BlocProvider(
      create: (context) => HomeCurrentViewModel()..getCurrent(),
      child: BlocConsumer<HomeCurrentViewModel, CurrentState>(
        listener: (context, state) {
          if (state is CurrentSucessState) {
            CurrentdataList.addAll(state.currentResponse.data as Iterable<CurrentData>);
          }
        },
        builder: (context, state) {
          var cubit = HomeCurrentViewModel.get(context);
          if (state is CurrentSucessState) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Color(0xFF7785DB),
                title: Text(
                  'Current Requests',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              body: Column(
                children: [
                  SizedBox(height: size.height * 0.025),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListCurrentRequests(currentData: CurrentdataList[index]);
                      },
                      itemCount: CurrentdataList.length,
                    ),
                  ),
                ],
              ),
            );
          }
          else if (state is CurrentLoadingState) {
            return CheckCode(text: 'Current Requests');
          } else {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Color(0xFF7785DB),
                title: Text(
                  'Current Requests',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Check your internet connection.',style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    )),
                    SizedBox(height: size.height * 0.015),
                    Container(
                      width: 150,
                      height:60,
                      decoration: BoxDecoration(
                        color: Color(0xFF7785DB),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(onPressed: (){
                        cubit.getCurrent();
                      }, icon: Text('Try Again',style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      )),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}