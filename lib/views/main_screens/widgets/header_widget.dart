import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // DYNAMIC WIDTH
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      padding:  EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/icons/searchBanner.jpeg'), fit: BoxFit.cover)),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          GestureDetector(
            onTap: (){},
            child: Image.asset('assets/icons/bell.png', width: width * 0.08, height: height * 0.08),
          ),
          SizedBox(width: width * 0.03,),
          GestureDetector(
            onTap: (){},
            child: Image.asset('assets/icons/message.png', width: width * 0.08, height: height * 0.08),
          ),
        ],)
      ],),
    );
  }
}