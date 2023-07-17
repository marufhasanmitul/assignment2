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
        title: const Text('News feeds'),
      ),
      body:GridView.builder(
          itemCount: 15,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10
          ),
          itemBuilder: (BuildContext context, int index){
              return Card(
                child: Image.network("https://maruf136.000webhostapp.com/image/maruf.jpeg",width: 50,height: 50,),
              );
          }
      ),
    );
  }
}
