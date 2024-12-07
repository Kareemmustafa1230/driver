import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/Model/CanceledOrederResponse.dart';
import 'package:mohamed/ui/ChackCode.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/HomeCurrentViewModel.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/states.dart';
import 'package:mohamed/ui/ListCanceledOrders.dart';

class CanceledOrders extends StatelessWidget {
  static const String routeName = 'Cancel-Orders';
  List<CanceledData> canceledData = [];

  CanceledOrders({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeCurrentViewModel()..getCancled(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF7785DB),
          centerTitle: true,
          title: const Text(
            'Cancel Orders',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: BlocConsumer<HomeCurrentViewModel, CurrentState>(
          listener: (context, state) {
            if (state is CanceledSucessState) {
              canceledData.addAll(
                  state.canceledOrederResponse.data as Iterable<CanceledData>);
            }
          },
          builder: (context, state) {
            var cubit = HomeCurrentViewModel.get(context);
            if (state is CanceledLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CanceledSucessState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListCanceledOrders(canceledData: canceledData[index],
                        );
                      },
                      itemCount: canceledData.length,
                    ),
                  ),
                ],
              );
            } else if (state is CanceledLoadingState) {
              return CheckCode(text: 'Cancel Orders');
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
                            cubit.getCancled();
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
