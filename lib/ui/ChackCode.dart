import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckCode extends StatelessWidget {
  String text;
  CheckCode({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF7785DB),
        title: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
