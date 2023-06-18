import 'package:flutter/material.dart';
class CartPage extends StatelessWidget{
  final String productName;

  const CartPage(this.productName);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(productName,style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
