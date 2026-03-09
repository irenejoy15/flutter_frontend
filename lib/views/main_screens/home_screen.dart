import 'package:flutter/material.dart';
import 'package:shop_app/views/main_screens/widgets/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children:[HeaderWidget()]),);
  }
}