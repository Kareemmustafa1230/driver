import 'package:flutter/material.dart';
import 'package:mohamed/Model/DeledateResponse.dart';

class ItemListDelegates extends StatelessWidget {
  DeledateData deledateData ;
  ItemListDelegates({super.key, required this.deledateData});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.only(top:size.height * 0.019,left: size.width * 0.049,right: size.width * 0.049),
      child: Container(
        padding: EdgeInsets.only(top: size.height * 0.019,left: size.width * 0.04,),
        decoration: BoxDecoration(
          borderRadius:  const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: const Color(0xFFCED5E1),
            width: 0.5,
          ),
          boxShadow: [
            const BoxShadow(
              color: Colors.white,
              blurRadius: 1.0,
              spreadRadius: 1.0,
              offset: Offset(0, 1),
            ),
          ]
        ),
        height: size.height * 0.14,
        width: 335,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: size.height * 0.072,
                  width: size.width * 0.153,
                  child: Image.asset('assets/images/Ellipse 15.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left:size.width * 0.04 ),
                      child: Text('${deledateData.name}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF000000),
                    ),
                    ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.only(left:size.width * 0.04 ),
                      child: Text('${deledateData.phone}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xFF262626),
                        ),
                    ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only( left:size.width * 0.575,right: size.width * 0.04 ),
              child: InkWell(
                onTap: (){
                },
                child: Container(
                  width: size.width * 0.237,//93
                  height: size.height * 0.0335,//28
                  alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7785DB),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text('Data',
                    style:TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                    ),
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
