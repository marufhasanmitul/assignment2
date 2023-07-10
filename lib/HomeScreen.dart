
import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart';

import 'listData.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<ReceptDatae> myReceptData = [];
  bool looDing=false;

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  void getProduct() async {
    looDing=true;
    setState(() {});
    Response response =
    await get(Uri.parse('https://maruf136.000webhostapp.com/foodreceved.json'));
    final Map<String, dynamic> decodeResponse = jsonDecode(response.body);



    if (response.statusCode == 200) {
      for (var foodData in decodeResponse['recipes']) {
        var title=foodData['title'];
        var description=foodData['description'];


        myReceptData.add(ReceptDatae(title, description));


        looDing=false;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Recipes"),
      ),
      body:looDing?const Center(child: CircularProgressIndicator(),):Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          itemCount: myReceptData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(myReceptData[index].title),
              subtitle: Text(myReceptData[index].description),
              leading:const Icon(Icons.receipt) ,

            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
