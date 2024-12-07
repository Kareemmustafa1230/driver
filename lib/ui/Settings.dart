import 'package:flutter/material.dart';
import 'package:mohamed/ui/List%20Delegates.dart';
import 'package:mohamed/ui/auth/edit%20profile/Edit%20profile.dart';
import 'package:mohamed/ui/auth/login/sign%20in.dart';
import 'package:mohamed/ui/itemSetting.dart';
import 'package:mohamed/ui/singout.dart';

import 'AddTaskBottomSheet.dart';

class Settings extends StatefulWidget {
  static const String routeName = 'Settings';

  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF7785DB),
        title: const Text('Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
         Center(
           child: Column(
               children: [
                 Container(
                   width:133,
                   height: 133,
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     border: Border.all(width: 2,color: const Color(0xFF7785DB),
                     ),
                   ),
             child: Container(
               width:120,
               height: 120,
               alignment: Alignment.center,
               decoration: BoxDecoration(
                 color: const Color(0xFF7785DB),
                 borderRadius: BorderRadius.circular(60),
               ),
               child: const Text('M',
               style: TextStyle(
                 fontSize: 36,
                 fontWeight: FontWeight.w600,
                 color: Colors.white,
               ),
               ),
             ),
                 ),
                 const SizedBox(height: 10,),
                 const Text('Mohamed Abdel Rahman',
                   style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.w500,
                     color: Color(0xFF000000),
                   ),
                 ),
                 const SizedBox(height: 8,),
                 const Text('#+201095193236',
                     style: TextStyle(
                   fontSize: 14,
                   fontWeight: FontWeight.w400,
                   color: Color(0xFF7A7A7A),
                 ),
                 ),
           ]
           ),
         ),
          const SizedBox(height: 16),
          ItemSetting(images: 'assets/images/gg_profile.png', title: 'Edit Profile',pushName: EditProfile.routeName,color: 0xFFC7C7C7),
          const Padding(
            padding:  EdgeInsets.only(left: 20,right: 20),
            child: Divider(
              color: Color(0xFFCED5E1),
              thickness: 1.5,
            ),
          ),
          ItemSetting(images: 'assets/images/tabler_users.png', title: 'List Delegates',pushName: ListDelegates.routeName,color: 0xFFC7C7C7),
          const Padding(
            padding:  EdgeInsets.only(left: 20,right: 20),
            child: Divider(
              color: Color(0xFFCED5E1),
              thickness: 1.5,
            ),
          ),
          InkWell(
            onTap: (){
              setState(() {
                showTaskAddBottomSheet();
              });
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 16,top: 16),
              child: Row(
                children: [
                  ImageIcon(AssetImage("assets/images/material-symbols_language.png"),
                    color: Color(0xFFC7C7C7),
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
          ),
          const Padding(
            padding:  EdgeInsets.only(left: 20,right: 20),
            child: Divider(
              color: Color(0xFFCED5E1),
              thickness: 1.5,
            ),
          ),
          Singout(images: 'assets/images/3min-mdi-light_logout (1).png', title: 'Sign Out', pushName: SignIn.routeName, color: 0xFFEB001B),
          const Padding(
            padding:  EdgeInsets.only(left: 20,right: 20),
            child: Divider(
              color: Color(0xFFCED5E1),
              thickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
  void showTaskAddBottomSheet(){
    showModalBottomSheet(
      context: context,
      builder: (context) => const AddTaskBottomSheet(),
    );
  }
}
