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
        title: const Text('Profile'),
      ),
      body:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  width: 230,
                  height: 230,
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("https://maruf136.000webhostapp.com/image/maruf.jpeg"),
                  ),
                ),
              ),
          ),
          Expanded(
              flex: 2,
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child:Column(
                        children: [
                          SizedBox(height: 12,),
                          Text("Maruf Hasan",style: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 20
                          ),),
                          SizedBox(height: 10,),
                          Text("I am Maruf Hasan Flutter Developer.This theme is Responsive.Module 10 Assignment",),
                        ],
                      )

                  ),
                  Expanded(
                      flex: 2,
                      child:GridView.builder(
                          itemCount: 10,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10

                          ),
                          itemBuilder: (BuildContext context, int index){
                            return Container(
                              width: 10,
                              height: 10,
                              child: Image.network("https://maruf136.000webhostapp.com/image/maruf.jpeg"),
                            );
                          }
                      )
                  ),



                ],
              )
          ),
        ],
      ) ,
    );
  }
}
