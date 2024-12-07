import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/Model/IncompleteOrderResponse.dart';
import 'package:mohamed/ui/ChackCode.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/HomeCurrentViewModel.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/states.dart';
import 'package:mohamed/ui/ListOfRequestsIncomplete.dart';

// ignore: must_be_immutable
class RequestsIncomplete extends StatelessWidget {
  static const String routeName = 'Requests-Incomplete';
  List<IncompleteData> incompleteData = [];
  @override
 final int? id;
  RequestsIncomplete({super.key, this.id});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeCurrentViewModel()..getIncomplte(),
      child:  Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF7785DB),
            centerTitle: true,
            title: const Text('Requests Incomplete',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
        body: BlocConsumer<HomeCurrentViewModel,CurrentState>(
          listener: (context, state) {
            if (state is IncompleteSucessState) {
              incompleteData.addAll(state.incompleteOrderResponse.data as Iterable<IncompleteData>);
            }
          },
            builder: (context, state) {
              var cubit = HomeCurrentViewModel.get(context);
              if (state is IncompleteLoadingState) {
             return const Center(
              child: CircularProgressIndicator(),
                );
            } else if (state is IncompleteSucessState) {
               return  Column(
                 children: [
                   SizedBox(height: size.height * 0.019),
                   Expanded(
                     child: ListView.builder(
                       itemBuilder: (context, index) {
                         return ListRequestsIncomplete(incompleteData: incompleteData[index]);
                       },
                       itemCount:incompleteData.length,
                     ),
                   ),
                 ],
               );
             } else if (state is IncompleteLoadingState) {
                return CheckCode(text: 'Requests Incomplete');
              } else {
                return Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Check Your Internet Connection.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        SizedBox(height: size.height * 0.015),
                        Container(
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFF7785DB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {
                              cubit.getIncomplte();
                            },
                            icon: const Text('Try Again',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
        ),
      ),
    );
  }
}