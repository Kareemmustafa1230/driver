import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemSetting extends StatelessWidget {
  String images;
  String title ;
  int color ;
  String pushName ;
  ItemSetting({super.key, required this.images,required this.title,required this.pushName,required this.color});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       Navigator.of(context).pushNamed(pushName);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 16,top: 16),
        child: Row(
          children: [
            ImageIcon(AssetImage(images),
              color: Color(color),
            ),
            const SizedBox(width: 8 ),
            Text(title,
              style: const TextStyle(
                fontSize: 14,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
      ),
    );
  }
}
