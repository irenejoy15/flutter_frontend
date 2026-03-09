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
        ],),
          SizedBox(height: height * 0.03,),
          SizedBox(
            height: height * 0.06,
            child: TextField(
              onTap: (){},
              decoration: InputDecoration(
                hintText: 'Enter Product Name',
                hintStyle: TextStyle(fontSize: width * 0.035, color: Color(0xFF7F7F7F)),
                contentPadding: EdgeInsets.symmetric(vertical: width * 0.03, horizontal: height * 0.015),
                prefixIcon: Image.asset('assets/icons/searc1.png', width: width * 0.05, height: height * 0.05),
                suffixIcon: Image.asset('assets/icons/cam.png', width: width * 0.05, height: height * 0.05),
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width * 0.05),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
      ],),
    );
  }
}