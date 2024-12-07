import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/Model/CanceledOrederResponse.dart';
import 'package:mohamed/Model/CompledtedOrderResponse.dart';
import 'package:mohamed/Model/CurrentResponse.dart';
import 'package:mohamed/Model/DeledateResponse.dart';
import 'package:mohamed/Model/IncompleteOrderResponse.dart';
import 'package:mohamed/ui/Canceled%20orders.dart';
import 'package:mohamed/ui/Completed%20orders.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/HomeCurrentViewModel.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/states.dart';
import 'package:mohamed/ui/HomeScreen/HomeScreen.dart';
import 'package:mohamed/ui/CurrentOrder/ListHomeCurrent%20Order.dart';
import 'package:mohamed/ui/CurrentOrder/current%20requests.dart';
import 'package:mohamed/ui/List%20Delegates.dart';
import 'package:mohamed/ui/ListHome.dart';
import 'package:mohamed/ui/Requests%20incomplete.dart';
import 'package:mohamed/ui/auth/login/sign%20in.dart';

class Ordermanagement extends StatelessWidget {
  static const String routeName = 'Order-management';
  // ignore: non_constant_identifier_names
  List<CurrentData> CurrentdataList = [] ;
  List<CanceledData> canceledData = [];
  List<CompledtedData> completeData = [] ;
  List<DeledateData> deledateData = [] ;
  List<IncompleteData> incompleteData = [];

  Ordermanagement({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeCurrentViewModel()..getCancled()..getComplte()..getIncomplte()..getCurrent()..getDelegate(),
      child: BlocConsumer<HomeCurrentViewModel, CurrentState>(
        listener: (context, state) {
          if (state is CurrentSucessState ) {
            CurrentdataList.addAll(state.currentResponse.data as Iterable<CurrentData>);
          }else if( state is CanceledSucessState){
            canceledData.addAll(state.canceledOrederResponse.data as Iterable<CanceledData>);
          }else if(state is CompleteSucessState){
            completeData.addAll(state.compledtedOrderResponse.data as Iterable<CompledtedData>);
          }else  if (state is DelegateSucessState) {
            deledateData.addAll(state.deledateResponse.data as Iterable<DeledateData>);
          }else if(state is IncompleteSucessState){
            incompleteData.addAll(state.incompleteOrderResponse.data as Iterable<IncompleteData>);
          }
          return ;
        },
        builder: (context, state) {
          // Use BlocBuilder here instead of Scaffold
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF7785DB),
              title: const Text(
                'Order management',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.width * 0.24),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        ListHome(
                          text: 'Completed Orders',
                          number: '${completeData.length}',
                          image: 'assets/images/Layer_1.png',
                          back: 0xFF50C128,
                          styel: 0xFFFFFFFF,
                          num1: 0.18,
                          num2: 0.41,
                          pushName: CompletedOrders.routeName,
                        ),
                        SizedBox(width: size.width * 0.09),
                        ListHomeCurrentOrder(
                          text: 'Current Orders',
                          number:
                          '${CurrentdataList.length}',
                          image: 'assets/images/Layer_3.png',
                          back: 0xFFFFFFFF,
                          styel: 0xFF7785DB,
                          num1: 0.18,
                          num2: 0.41,
                          pushName: CurrentRequests.routeName,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.029),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        ListHome(
                          text: 'Canceled orders',
                          number:
                          '${canceledData.length}',
                          image: 'assets/images/Layer_4.png',
                          back: 0xFFEB001B,
                          styel: 0xFFFFFFFF,
                          num1: 0.18,
                          num2: 0.41,
                          pushName: CanceledOrders.routeName,
                        ),
                        SizedBox(width: size.width * 0.09),
                        ListHome(
                          text: 'Requests Incomplete',
                          number: '${incompleteData.length}',
                          image: 'assets/images/Layer_2.png',
                          back: 0xFFFF9110,
                          styel: 0xFFFFFFFF,
                          num1: 0.18,
                          num2: 0.41,
                          pushName: RequestsIncomplete.routeName,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.029),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        ListHome(
                          text: 'sign out',
                          number: '',
                          image: 'assets/images/mdi-light_logout.png',
                          back: 0xFFFFFF,
                          styel: 0xFFFFFFFF,
                          num1: 0.14,
                          num2: 0.41,
                          pushName: SignIn.routeName,
                        ),
                        SizedBox(width: size.width * 0.09),
                        ListHome(
                          text: 'List Delegates',
                          number: '${deledateData.length}',
                          image: 'assets/images/Layer_5.png',
                          back: 0xFF7785DB,
                          styel: 0xFFFFFFFF,
                          num1: 0.18,
                          num2: 0.41,
                          pushName: ListDelegates.routeName,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.035),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF7785DB),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      width: size.width * 0.885,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(HomeScreen.routeName);
                        },
                        child: const Text(
                          'Sign IN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}