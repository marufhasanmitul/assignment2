import 'package:flutter/material.dart';

class MyPortraitBody extends StatefulWidget {
  const MyPortraitBody({Key? key}) : super(key: key);

  @override
  State<MyPortraitBody> createState() => _MyPortraitBodyState();
}

class _MyPortraitBodyState extends State<MyPortraitBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Feed"),
      ),
      body:ListView.builder(
          itemCount: 15,
          itemBuilder:(context,index){
            return Card(
              child: Image.network("https://maruf136.000webhostapp.com/image/maruf.jpeg",width: 100,height: 100,),
            );
          }
      ) ,
    );
  }
}
