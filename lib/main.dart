import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Source code Follow
main(){
  runApp(const MyApp());//Applicaton
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme:ThemeData(primarySwatch: Colors.grey) ,
        darkTheme: ThemeData(primarySwatch: Colors.amber),
        color: Colors.blue,
        debugShowCheckedModeBanner: false,
        home: HomeActivity());
  }
}

class HomeActivity extends StatelessWidget{

  MySnackbar(message,context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Photo Gallery') ,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(8),
                child: Text(
                  'Welcome to Photo Gallery!',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: (IconButton(
                          onPressed: () {}, icon: Icon(Icons.search))),
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 20,
                runSpacing: 20,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Colors.white,width: 0
                            )
                        )
                    ),
                    onPressed: () {
                     MySnackbar("Clicked on photo!",context);
                    },
                    child: Column(
                      children: [
                        Image.network('https://maruf136.000webhostapp.com/image/nature.jpg',
                          height: 90,
                          width: 100,),
                        Text('Caption',style: TextStyle(fontSize: 20,color: Colors.black),)
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Colors.white,width: 0
                            )
                        )
                    ),
                    onPressed: () {
                      MySnackbar("Clicked on photo!",context);
                    },
                    child: Column(
                      children: [
                        Image.network('https://maruf136.000webhostapp.com/image/nature.jpg',
                          height: 90,
                          width: 100,),
                        Text('Caption',style: TextStyle(fontSize: 20,color: Colors.black),)
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Colors.white,width: 0
                            )
                        )
                    ),
                    onPressed: () {
                      MySnackbar("Clicked on photo!",context);
                    },
                    child: Column(
                      children: [
                        Image.network('https://maruf136.000webhostapp.com/image/nature.jpg',
                          height: 90,
                          width: 100,),
                        Text('Caption',style: TextStyle(fontSize: 20,color: Colors.black),)
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Colors.white,width: 0
                            )
                        )
                    ),
                    onPressed: () {
                      MySnackbar("Clicked on photo!",context);
                    },
                    child: Column(
                      children: [
                        Image.network('https://maruf136.000webhostapp.com/image/nature.jpg',
                          height: 90,
                          width: 100,),
                        Text('Caption',style: TextStyle(fontSize: 20,color: Colors.black),)
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Colors.white,width: 0
                            )
                        )
                    ),
                    onPressed: () {
                      MySnackbar("Clicked on photo!",context);
                    },
                    child: Column(
                      children: [
                        Image.network('https://maruf136.000webhostapp.com/image/nature.jpg',
                          height: 90,
                          width: 100,),
                        Text('Caption',style: TextStyle(fontSize: 20,color: Colors.black),)
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Colors.white,width: 0
                            )
                        )
                    ),
                    onPressed: () {
                      MySnackbar("Clicked on photo!",context);
                    },
                    child: Column(
                      children: [
                        Image.network('https://maruf136.000webhostapp.com/image/nature.jpg',
                          height: 90,
                          width: 100,),
                        Text('Caption',style: TextStyle(fontSize: 20,color: Colors.black),)
                      ],
                    ),
                  ),


                ],
              ),

              ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  SizedBox(height: 10),
                  ListTile(
                    title: Text(
                      'Sample Photo 1',
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text('Category 1'),
                    leading: Icon(Icons.image),
                    tileColor: Colors.black12,
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text(
                      'Sample Photo 1',
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text('Category 1'),
                    leading: Icon(Icons.image),
                    tileColor: Colors.black12,
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text(
                      'Sample Photo 1',
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text('Category 1'),
                    leading: Icon(Icons.image),
                    tileColor: Colors.black12,
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ],
              )


            ],
          ),
        ),
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MySnackbar("Uploaded Successfully!",context);
        },
        child: Icon(Icons.cloud_upload),

      ),



    );


  }
}
