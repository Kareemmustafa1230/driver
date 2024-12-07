import 'package:flutter/material.dart';
import 'package:mohamed/Model/CanceledOrederResponse.dart';
// ignore: must_be_immutable
class ListCanceledOrders extends StatelessWidget {
 CanceledData canceledData;
 ListCanceledOrders({super.key, required this.canceledData});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
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
        height:  size.height * 0.119,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: size.height * 0.019,left:size.width * 0.044),
                  child: Text('Order Number  ${canceledData.code}',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF262626)
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: size.height * 0.019,right: size.width * 0.044),
                  child: Text( canceledData.createdAt??"",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF262626)
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: size.width * 0.044),
                  child: const Text('Buyer Information and Order Details',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF7785DB),
                    ),
                  ),
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
              child: const Text('Canceled Orders',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  color: Color(0xFFEB001B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
