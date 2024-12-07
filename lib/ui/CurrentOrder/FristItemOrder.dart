import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohamed/Model/OrderlResponse.dart';
import 'package:mohamed/ui/CurrentOrder/ItemOfOrder%20details.dart';

class FristItem extends StatelessWidget {
  List<Product> productsList ;
  FristItem({required this.productsList});
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
         return Divider(
            thickness: 1,
          );
        },
        itemBuilder: (context, index) {
          return ItemOrderDetails(productsdata :productsList[index]);
        },
        itemCount: productsList.length,
      ),
    );
  }
}
