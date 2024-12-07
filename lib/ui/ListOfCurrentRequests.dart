import 'package:flutter/material.dart';
import 'package:mohamed/Model/CurrentResponse.dart';
import 'package:mohamed/ui/CurrentOrder/Order%20details.dart';

class ListCurrentRequests extends StatelessWidget {
  CurrentData currentData ;
  ListCurrentRequests({super.key, required this.currentData});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top:size.height * 0.015,left: size.width * 0.05,right: size.width * 0.05),
      decoration: BoxDecoration(
        borderRadius:  const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: const Color(0xFFCED5E1),
          width: 1,
        ),
      ),
      height: size.height * 0.13,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16,left: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('order number  ${currentData.code ?? ""}',
                    style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF262626),
                  fontWeight: FontWeight.w400
              ),
                  ),
                  Text(currentData.createdAt??"",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF262626),
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),
            SizedBox( height:size.height * 0.031 ),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OrderDetails(
                          id:currentData.id ?? 0,
                      );
                    },
                  ),
                );
                },
              child: Container(
                width: 137,
                height: 34,
                decoration: BoxDecoration(
                  color: const Color(0xFF7785DB),
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: const Text('Preview the order',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
