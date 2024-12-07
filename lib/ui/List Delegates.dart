import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/Model/DeledateResponse.dart';
import 'package:mohamed/ui/ChackCode.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/HomeCurrentViewModel.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/states.dart';
import 'package:mohamed/ui/ItemListDelegates.dart';
class ListDelegates extends StatelessWidget {
  static const String routeName = 'List-Delegates';
  List<DeledateData> deledateData = [];

  ListDelegates({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return BlocProvider(
      create: (context) =>
      HomeCurrentViewModel()
        ..getDelegate(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF7785DB),
          title: const Text('List of Delegates',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: BlocConsumer<HomeCurrentViewModel, CurrentState>(
          listener: (context, state) {
            if (state is DelegateSucessState) {
              deledateData.addAll(
                  state.deledateResponse.data as Iterable<DeledateData>);
            }
          },
          builder: (context, state) {
            var cubit = HomeCurrentViewModel.get(context);
            if (state is DelegateLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DelegateSucessState) {
              return Column(
                children: [
                  SizedBox(height: size.height * 0.03),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ItemListDelegates(
                          deledateData: deledateData[index],);
                      },
                      itemCount: deledateData.length,
                    ),
                  ),
                ],
              );
            } else if (state is DelegateLoadingState) {
              return CheckCode(text: 'List of Delegates');
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
                            cubit.getDelegate();
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