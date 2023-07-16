import 'package:flutter/material.dart';

class MyLandscapeBody extends StatefulWidget {
  const MyLandscapeBody({Key? key}) : super(key: key);

  @override
  State<MyLandscapeBody> createState() => _MyLandscapeBodyState();
}

class _MyLandscapeBodyState extends State<MyLandscapeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('D E S K T O P'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                      aspectRatio:16/9,
                      child:Container(
                        color: Colors.deepPurple[400],
                      ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                     itemCount: 20,
                      itemBuilder: (context,index){
                       return Padding(
                         padding: EdgeInsets.all(10),
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
          ),
          SizedBox(width: 30,),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.deepPurple[400],
                ),
              )
          )
        ],
      ),
    );
  }
}
