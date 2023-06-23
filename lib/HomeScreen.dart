import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Regex for Email
/*
  ==============Form Validation Step===========
  01.Form Widget--Property Use- Key:todoForm  Inside-TextFormField widget
  02.Form Holding Global Key--e.g--GlobalKey<FormState> todoForm = GlobalKey<FormState>();
  03.TextFormField Property--
   Validator (this Parenthesis return Text filed value return){
      return Null;--is Right
  }


*/



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _titleTextEditingController=TextEditingController();
  final TextEditingController _descriptionTextEditingController=TextEditingController();

  TextEditingController _UpdteTextControlar=TextEditingController();
  TextEditingController _UpdteDescriptionControlar=TextEditingController();




  List<Todos>todos=[];

  GlobalKey<FormState> todoForm = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen',style: TextStyle(color: Colors.yellow),),
        actions: [
          IconButton(
              onPressed: (){
                todos.clear();
                if(mounted){
                  setState(() {});
                }
              },
              icon: Icon(Icons.cleaning_services_rounded))
        ],
      ),
      body: Container(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    onLongPress: (){
                      todos[index].isDone=!todos[index].isDone;
                      if(mounted){
                        setState(() {});
                      }
                    },
                    leading:todos[index].isDone ? Icon(Icons.done_outline) :Icon(Icons.close),
                    title: Text("${todos[index].title}"),
                    subtitle: Text("${todos[index].Description}"),
                    trailing:Wrap(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: (){
                            String title=todos[index].title;
                            String desc=todos[index].Description;
                            int indexId=index;
                            _UpdteTextControlar.text=title;
                            _UpdteDescriptionControlar.text=desc;
                            showAlertDialog(indexId);
                          },
                        ),
                        IconButton(
                          icon: Icon(CupertinoIcons.delete),
                          onPressed: (){
                            todos.removeAt(index);
                            if(mounted){
                              setState(() {});
                            }
                          },
                        ),

                      ],
                    ),

                  ),
                );
              }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(mounted){
            showAddNewTodoModalSheet();
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),

    );

  }

  void showAddNewTodoModalSheet(){
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          )
        ),
        backgroundColor: Colors.white,

        builder: (context){
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: todoForm,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Add New Todo"),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _titleTextEditingController,
                    decoration: InputDecoration(
                      label: Text('Enter Yor Email'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color: Colors.yellow)
                      )
                    ),
                    validator: (String? value) {
                     if(value?.trim().isEmpty ?? true){
                       return 'Please enter your title';
                     }
                     return null;
                    },

                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _descriptionTextEditingController,
                    decoration: InputDecoration(
                        label: Text('Enter Your Password'),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.yellow)
                        )
                    ),
                    validator: (String? value) {
                      if(value?.trim().isEmpty ?? true){
                        return 'Please enter your title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                         if(todoForm.currentState!.validate()){
                           todos.add(Todos(_titleTextEditingController.text.trim(), _descriptionTextEditingController.text.trim(), false));
                           if(mounted){
                             setState(() {});
                           }
                           _titleTextEditingController.clear();
                           _descriptionTextEditingController.clear();
                           Navigator.pop(context);
                         }
                        },

                        child: Text('Add'),
                    ),
                  )
                ],
              ),
            ),
          );
        }

    );
  }

  void showAlertDialog(int indexId){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('UpDate TODO'),
            content: Container(
              height: 250,
              width: 300,
              child: Column(

                children: [
                  TextFormField(
                    controller: _UpdteTextControlar,
                    //initialValue:title,
                    decoration: InputDecoration(
                      hintText: "dsfdsf",
                      label: Text('Name'),
                      border: OutlineInputBorder(
                      )

                    ),

                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _UpdteDescriptionControlar,
                    //initialValue:desc,
                    decoration: InputDecoration(
                        hintText: "dsfdsf",
                        label: Text('Name'),
                        border: OutlineInputBorder(
                        )

                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel')
                      ),
                      SizedBox(width: 20,height: 20,),
                      ElevatedButton(
                          onPressed: (){
                              todos[indexId]=Todos(_UpdteTextControlar.text,_UpdteDescriptionControlar.text, false);
                              if(mounted){
                                setState(() {});
                              }
                              _UpdteTextControlar.clear();
                              _UpdteDescriptionControlar.clear();
                              Navigator.pop(context);

                          },
                          child: Text('Update')
                      )
                    ],
                  )

                ],
              ),
            ),
          );
        }
    );
  }











}





// to do
// title,Descrioption,done

class Todos{
  String title,Description;
  bool isDone;
  Todos(this.title,this.Description,this.isDone);

}



