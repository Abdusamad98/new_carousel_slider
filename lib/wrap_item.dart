import 'package:flutter/material.dart';

class WrapItem extends StatelessWidget {
  const WrapItem({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:const Color(0xFFFEAD1D).withOpacity(0.1)
      ),
      padding:const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      child: Text(
        text,
        style:const TextStyle(fontSize: 12, fontWeight: FontWeight.w400
        ,color: Color(0xFFDA6217)
        ),
      ),
    );
  }
}
