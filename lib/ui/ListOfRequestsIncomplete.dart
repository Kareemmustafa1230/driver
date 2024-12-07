import 'package:flutter/material.dart';
import 'package:mohamed/Model/IncompleteOrderResponse.dart';

// ignore: must_be_immutable
class ListRequestsIncomplete extends StatelessWidget {
  IncompleteData incompleteData ;
  ListRequestsIncomplete({super.key, required this.incompleteData});
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
        height: size.height * 0.189,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: size.height * 0.019,left:size.width * 0.044),
                  child: Text('Order Number  ${incompleteData.code}',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF262626)
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: size.height * 0.019,right: size.width * 0.044),
                  child: Text(incompleteData.createdAt??"",
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
            Padding(
              padding:  EdgeInsets.only(left: size.width * 0.044),
              child: const Text('Reason for Not Delivering the Order :',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF262626),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: size.width * 0.044,top: size.height * 0.012),
              child: const Text('For a buyer who was not home',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF888888),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.019),
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
              child: const Text('Not Received',
                style: TextStyle(
                    color: Color(0xFFFF9110),
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
