import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Source code Follow
main(){
  runApp(const myApp());//Applicaton
}

class myApp extends StatelessWidget{
  const myApp({super.key});

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
      //Appbar=============
      appBar: AppBar(
        title: Text("My First app"),
        titleSpacing: 0,
        toolbarHeight: 70,
        toolbarOpacity: 1,
        elevation: 10,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                MySnackbar("I am comments", context);
              },
              icon: Icon(Icons.comment)),
          IconButton(
              onPressed: () {
                MySnackbar("I am Search", context);
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                MySnackbar("I am Setting", context);
              },
              icon: Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                MySnackbar("I am Email", context);
              },
              icon: Icon(Icons.email)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.add),
        onPressed: () {
          MySnackbar("I am floting Action Buttton", context);
        },
        backgroundColor: Colors.amber,
      ),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: 0,
        items: [

          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: "Contract"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),


        ],
        onTap: (int index){
          if(index==0){
            MySnackbar("I am Home Bottom Menu", context);
          }
          if(index==1){
            MySnackbar("I am Home Contract Menu", context);
          }
          if(index==2){
            MySnackbar("I am Home Profile Menu", context);
          }

        },
      ) ,
      drawer:Drawer(
        child:ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(

                decoration: BoxDecoration(color: Colors.white,),
                accountName: Text('Maruf hasan',style: TextStyle(color: Colors.black),),
                accountEmail: Text('info@gmail.com',style: TextStyle(color: Colors.black)) ,
                currentAccountPicture: Image.network("https://beautifulbangladesh.gov.bd/storage/backend/uploads/1/soil.jpg",),
                onDetailsPressed: (){
                  MySnackbar("I am Header Details", context);
                },
              ),
            ),
            ListTile(

              leading: Icon(Icons.home),

              title: Text('Home'),

              onTap: () {
                MySnackbar("I am Home", context);
              },

            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Contract'),
              onTap: (){
                MySnackbar("I am contract", context);
              },

            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: (){
                MySnackbar("I am Profile", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              onTap: (){
                MySnackbar("I am Eamil", context);
              },

            ),
            ListTile(
              leading: Icon(Icons.phone_android_outlined),
              title: Text('Phone'),
              onTap: (){
                MySnackbar("I am Phone", context);
              },
            ),
          ],
        ),
      ),

      //Body===============
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: Center(child: Text('This is Our Home Page',style: TextStyle(color: Colors.white,fontSize: 30),)),
      ),






    );


  }
}