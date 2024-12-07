import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/Model/CurrentResponse.dart';
import 'package:mohamed/Model/OrderlResponse.dart';
import 'package:mohamed/ui/ChackCode.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/HomeCurrentViewModel.dart';
import 'package:mohamed/ui/CurrentOrder/FristItemOrder.dart';
import 'package:mohamed/ui/CurrentOrder/SecondOrder.dart';
import 'package:mohamed/ui/Order%20management.dart';
import 'Cuibt/states.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({
    required this.id,
  });

  static const String routeName = 'Order-Details';
  final int id;
  List<Product> product = [];
  CurrentData? Currentdata;

  Details? userDetails;

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeCurrentViewModel()
        ..getFistData(id: id)
        ..getCurrent(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF7785DB),
          title: Text(
            'Order Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: BlocConsumer<HomeCurrentViewModel, CurrentState>(
          listener: (context, state) {
            if (state is CurrentOrderSucessState) {
              product.addAll(state.currentOrderResponse.products);
              userDetails = state.currentOrderResponse.userDetails;
            } else if (state is CurrentSucessState) {
              Currentdata = state.currentResponse.data as CurrentData?;
            }
          },
          builder: (context, state) {
            var cubit = HomeCurrentViewModel.get(context);
            if (state is CurrentLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CurrentOrderSucessState) {
              return Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.075,
                  top: size.height * 0.038,
                  right: size.width * 0.075,
                  bottom: size.height * 0.038,
                ),
                child: Container(
                  width: 335,
                  height: 710,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFCED5E1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.019,
                          left: size.width * 0.04,
                        ),
                        child: Text(
                          'Order Details',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF7785DB),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (product.isNotEmpty)
                        FristItem(productsList: product),
                      if (userDetails != null)
                        SecondOrder(
                          userDetails: userDetails!,
                        ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 20, top: 0, right: 16, left: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  await cubit.postCanceled(id: id);
                                  cubit.getCurrent();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Ordermanagement();
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  width: size.width * 0.305,
                                  height: size.height * 0.048,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFEB001B),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.03,
                                        top: size.height * 0.013,
                                        bottom: size.height * 0.013),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Cancel Order',
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        ImageIcon(
                                          AssetImage(
                                              "assets/images/material-symbols_cancel-outline-rounded.png"),
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.15),
                            InkWell(
                              onTap: () async {
                                print('${id}sdsadsadsads');
                                await cubit.postAccept(id: id);
                                cubit.getCurrent();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Ordermanagement();
                                    },
                                  ),
                                );
                              },
                              child: Expanded(
                                child: Container(
                                  width: size.width * 0.305,
                                  height: size.height * 0.048,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFF50C128),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.04,
                                        top: size.height * 0.013,
                                        bottom: size.height * 0.013,
                                        right: size.width * 0.04),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          child: Text(
                                            'Prepared',
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        ImageIcon(
                                          AssetImage(
                                              "assets/images/eva_checkmark-circle-outline.png"),
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is CurrentOrderLoadingState) {
              return CheckCode(text: 'Order Details');
            } else {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Check your internet connection.',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      SizedBox(height: size.height * 0.015),
                      Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFF7785DB),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {
                            cubit.getFistData(id: id);
                            cubit.getCurrent();
                          },
                          icon: Text('Try Again',
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
