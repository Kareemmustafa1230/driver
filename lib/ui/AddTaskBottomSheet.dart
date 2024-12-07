import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  static const String routeName = 'Add-Task-Bottom-Sheet';

  const AddTaskBottomSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddTaskBottomSheetState createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  bool _englishActive = false;
  bool _arabicActive = true;

  void toggleEnglish() {
    setState(() {
      _englishActive = true;
      _arabicActive = false;
    });
  }

  void toggleArabic() {
    setState(() {
      _arabicActive = true;
      _englishActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      width: 375,
      height: 208,
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Change the language',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Divider(
              thickness: 1.5,
              color: Colors.black,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: GestureDetector(
                onTap: toggleEnglish,
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage(_englishActive
                          ? "assets/images/Group 1000000803.png"//
                          : "assets/images/Ellipse 17.png"),
                      color: _englishActive ? const Color(0xFF7785DB) : const Color(0xFF7785DB),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16),
                      child: const Text(
                        'English',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 19),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: GestureDetector(
                onTap: toggleArabic,
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage(_arabicActive
                          ? "assets/images/Group 1000000803.png"//
                          : "assets/images/Ellipse 17.png"),
                      color: _arabicActive ? const Color(0xFF7785DB) : const Color(0xFF7785DB),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16),
                      child: const Text(
                        'العربية',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}