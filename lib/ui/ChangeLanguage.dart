import 'package:flutter/material.dart';
import 'package:mohamed/ui/AddTaskBottomSheet.dart';
class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          Navigator.of(context).pushNamed(AddTaskBottomSheet.routeName);
        });
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 20, bottom: 16,top: 16),
        child: Row(
          children: [
            ImageIcon(AssetImage("assets/images/material-symbols_language.png"),
            ),
            SizedBox(width: 8 ),
            Text('Arabic',
              style:TextStyle(
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

  void showTaskAddBottomSheet(context){
    showModalBottomSheet(
      context: context,
      builder: (context) => const AddTaskBottomSheet(),
    );
  }
}



