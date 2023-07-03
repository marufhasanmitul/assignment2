import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenUI();
  }
}
class HomeScreenUI extends State<HomeScreen>{




  List<Contact>contacts =[
    Contact("John Doe", "johndoe@example.com","1111111"),
    Contact("Jane Smith","janesmith@example.com","222222"),
    Contact("Allice Johnson", "allicejohnson@example.com","33333"),
    Contact("Maruf Hasan", "marufhasan136@gmail.com","33333"),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
      ),

      body: Container(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    title: Text("${contacts[index].name}"),
                    onTap:(){
                      showBottomSheet(index);
                    } ,
                  ),
                );
              }

          ),
        ),
      ),
    );
  }






  void showBottomSheet(int indexId ){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 230,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Contact's Details,",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10),
                    Text("Name : "+contacts[indexId].name,style: TextStyle(fontSize: 16),),
                    const SizedBox(height: 10),
                    Text("Email address : "+contacts[indexId].email,style: TextStyle(fontSize: 16),),
                    const SizedBox(height: 10),
                    Text("phone number: "+contacts[indexId].phoneNumber,style: TextStyle(fontSize: 16),),


                  ],
                ),
              ),
            ),
          );
        }
    );
  }



}

class Contact {
  String name;
  String email;
  String phoneNumber;

  Contact(this.name, this.email, this.phoneNumber);
}