import 'package:assignment2/responsive/Landscape.dart';
import 'package:assignment2/responsive/Portrait.dart';
import 'package:assignment2/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ResponsiveLayout(
        PortraitBody: MyPortraitBody(),
        LandscapeBody: MyLandscapeBody(),
      ),
    );
  }
}
