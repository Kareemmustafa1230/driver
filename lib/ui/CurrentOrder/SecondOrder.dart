import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/Model/IncompleteOrderResponse.dart';
import 'package:mohamed/Model/OrderlResponse.dart';
import 'package:mohamed/ui/CurrentOrder/Cuibt/HomeCurrentViewModel.dart';

import 'Cuibt/states.dart';

class SecondOrder extends StatelessWidget {
  IncompleteData? incompleteData ;
  Details userDetails ;
  SecondOrder({required this.userDetails});
  Product? product;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var cubit = HomeCurrentViewModel.get(context);
    return BlocProvider(
      create: (context) => HomeCurrentViewModel(),
    child: BlocConsumer<HomeCurrentViewModel, CurrentState>(
        listener: (context, state) {

    },
    builder: (context, state) {
      var cubit = HomeCurrentViewModel.get(context);
      return  Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, right: size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.018),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Discount Coupon',
                        style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      Text('${userDetails.discountCoupon} D.A',
                        style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Cost',
                        style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      Text('${userDetails.deliveryCost} D.A',
                        style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Final Cash Total',
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      Text('${userDetails.finalCash} D.A',
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    children: [
                      ImageIcon(AssetImage(
                          "assets/images/iconamoon_profile-thin.png"),
                        color: Color(0xFF7785DB),
                      ),
                      SizedBox(width: 8),
                      Text('Buyer Information',
                        style: TextStyle(
                            color: Color(0xFF7785DB),
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.018),
                  Row(
                    children: [
                      Text('Name:',
                        style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('${userDetails.userName}',
                        style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.0135),
                  Row(
                    children: [
                      Text('Number Phone:',
                        style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('${userDetails.userPhone}',
                        style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.0135),
                  Text('Address'),
                  Container(
                    color: Color(0xFFF6F9FF), //0xFFF6F9FF
                    width: size.width * 80,
                    height: size.height * 0.06,
                    child: Row(
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/carbon_location.png"),
                        ),
                        SizedBox(width: 16),
                        Expanded(child: Text('${userDetails.address}')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
    }
    ),
    );
  }
}