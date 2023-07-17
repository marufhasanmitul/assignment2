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
        title: Text("Profile"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 220,
                    height: 220,
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://maruf136.000webhostapp.com/image/maruf.jpeg"),
                    ),
                  ),
                  Text("Maruf Hasan",textAlign: TextAlign.center,style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 20
                  ),),
                  SizedBox(height: 10,),
                  Text("I am Maruf Hasan Flutter Developer.This theme is Responsive.Module 10 Assignment",textAlign: TextAlign.center,)
                ],
              )
          ),
          Expanded(
              flex: 1,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10

                  ),
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      child: Image.network("https://maruf136.000webhostapp.com/image/maruf.jpeg"),
                    );
                  }
              )
          ),
        ],
      ) ,
    );
  }
}
