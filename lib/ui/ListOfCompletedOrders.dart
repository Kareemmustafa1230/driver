import 'package:flutter/material.dart';
import 'package:mohamed/Model/CompledtedOrderResponse.dart';
// ignore: must_be_immutable
class ListCompletedOrders extends StatelessWidget {
  CompledtedData compledtedData ;
  ListCompletedOrders({super.key, required this.compledtedData});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.019,left: size.width * 0.05,right:  size.width * 0.05),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color:const Color(0xFFCED5E1),
              width: 1
            ),
            borderRadius: BorderRadius.circular(5)
          ),
          width: 335,
          height:  size.height * 0.159,
          child: Column(
            children: [
               SingleChildScrollView(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       padding: EdgeInsets.only(top: size.height * 0.019,left:size.width * 0.044),
                         child: Text('Order Number ${compledtedData.code}',
                         style: const TextStyle(
                             fontSize: 14,
                             color: Color(0xFF262626),
                             fontWeight: FontWeight.w400
                         ),
                         ),
                     ),
                     Container(
                       padding: EdgeInsets.only(top: size.height * 0.019,right: size.width * 0.044),
                         child: Text( compledtedData.createdAt??"",
                           style: const TextStyle(
                               fontSize: 14,
                               color: Color(0xFF262626),
                               fontWeight: FontWeight.w400
                           ),
                         ),
                     ),
                   ],
                 ),
               ),
              SizedBox(height:size.height * 0.02),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: size.width * 0.044),
                    child: const Text('Driver Name',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF888888),
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: size.width * 0.044),
                    child: const Text('Ahmed Ail Mohamed',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF888888),
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.019),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: size.width * 0.044),
                      child: const Text('Buyer Information And order Details',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7785DB),
                      ),
                      ),//0xFF7785DB
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: size.width * 0.040),
                    child: const Icon(Icons.arrow_forward_ios,size: 24,color: Color(0xFF7785DB)),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.003),
              Container(
                padding: EdgeInsets.only(left: size.width * 0.044),
                alignment: Alignment.topLeft,
                  child: const Text('Completed Delivery',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF50C128),
                        fontWeight: FontWeight.w400
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
