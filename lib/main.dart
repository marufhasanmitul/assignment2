
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CartPage.dart';
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
        home: ProductList());
  }
}

class ProductList extends StatefulWidget{
  const ProductList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductListState();
  }
}
class _ProductListState extends State{
  int count=0;
  var products=[
    {"name":"Product 1","price":"10.00"},
    {"name":"Product 2","price":"15.00"},
    {"name":"Product 3","price":"20.00"},
    {"name":"Product 4","price":"20.00"},
    {"name":"Product 5","price":"20.00"},
    {"name":"Product 6","price":"20.00"},
    {"name":"Product 7","price":"20.00"},
    {"name":"Product 8","price":"20.00"},
    {"name":"Product 9","price":"20.00"},
    {"name":"Product 10","price":"20.00"},
    {"name":"Product 11","price":"20.00"},
    {"name":"Product 12","price":"20.00"},
    {"name":"Product 13","price":"20.00"},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context,index){
              return ListTile(
                title: Text("${products[index]['name']!}",style: TextStyle(fontSize: 20,), ),
                subtitle: Text("\$ ${products[index]['price']!}"),
                trailing: 
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("Count : ${count}"),
                      ElevatedButton(
                          onPressed: (){
                            count=count+1;
                            setState(() {

                            });

                            if(count==5){
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      title: Text('Congratulations!'),
                                      content: Text('You\'ve bought 5 ${products[index]['name']!}'),
                                      actions: [
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            count=0;
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Go to Cart'),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder:(_)=>CartPage('Total Product : 5') ));
                                            count=0;
                                          },
                                        ),

                                      ],

                                    );
                                  }
                              );


                            }


                          },
                          child: Text('Buy Now')
                      )
                    ],
                  ),
                ) ,
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}


