import 'package:flutter/cupertino.dart';
import 'package:mohamed/Model/OrderlResponse.dart';
class ItemOrderDetails extends StatelessWidget {
  Product productsdata ;
  ItemOrderDetails({required this.productsdata});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 115,
      height: size.height * 0.17,//155
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.025,top: size.height * 0.019),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(productsdata.image??""),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:size.width * 0.032 ,top: size.height * 0.019),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.025,),
                      Text(productsdata.name??"",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xFF262626),
                      ),
                      ),
                      SizedBox(height: size.height * 0.0125,),
                      Row(
                        children: [
                          Text('Quantity:',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF888888)
                            ),
                          ),
                          SizedBox(width: size.width * 0.021),
                          Text("${productsdata.quantity}"),
                        ],
                      ),
                      SizedBox(height: size.height * 0.0125,),
                      Row(
                        children: [
                          Text('Price:'),
                          SizedBox(width: 8),
                          Text(productsdata.price??""),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
