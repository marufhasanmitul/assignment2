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
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            margin:EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage("https://maruf136.000webhostapp.com/image/maruf.jpeg",),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Maruf Hasan",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text("I am Maruf Hasan Flutter Developer and I worked in Java+android,Backend Service Php And Laravel,API Creation,PhotoEditing etc",style: TextStyle(height: 1.5),),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
                itemCount:10 ,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                      color: Colors.deepPurple[400],
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
