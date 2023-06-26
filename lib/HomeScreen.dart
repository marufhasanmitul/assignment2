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
  final TextEditingController _titleController=TextEditingController();
  final TextEditingController _descriptionController=TextEditingController();
  final TextEditingController _dayRequireControl=TextEditingController();

  GlobalKey<FormState>taskForm=GlobalKey<FormState>();

  List<listItem>taskItme=[];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showAlertDialog();
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: taskItme.length,
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    title: Text("${taskItme[index].title}"),
                    subtitle: Text("${taskItme[index].description} \nDay Required - ${taskItme[index].deadline} day"),
                    onLongPress:(){
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




  void showAlertDialog(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title:const Text(" Add Task") ,
            content: SingleChildScrollView(
              child: SizedBox(
                height: 350,
                child: Form(
                  key: taskForm,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'title',
                        ),
                        validator: (String? value){
                          if(value?.trim().isEmpty ?? true){
                            return 'Please Enter Your Tilte';
                          }
                          return null;
                        },

                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _descriptionController,
                        decoration:InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 10
                            )
                          ),
                          hintText: 'description',
                        ),
                        maxLines: 4,
                        validator: (String? value){
                          if(value?.trim().isEmpty ?? true){
                            return "Please Enter Your Description";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _dayRequireControl,
                        decoration: InputDecoration(
                          hintText:'Days Required',
                          border: OutlineInputBorder(),

                        ),
                        validator: (String? value){
                          if(value?.trim().isEmpty ?? true){
                            return "Please Enter Your Days";
                          }
                          return null;
                        },
                      )
                    ],

                  ),
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    if(taskForm.currentState!.validate()){
                      taskItme.add(listItem(_titleController.text.trim(), _descriptionController.text.trim(),_dayRequireControl.text.trim()));
                      if(mounted){
                        setState(() {});
                      }
                      Navigator.pop(context);
                    }



                    _titleController.clear();
                    _descriptionController.clear();
                    _dayRequireControl.clear();

                  },
                  child: const Text('Save')
              )
            ],
          );
        }
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
                    const Text("Task Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10),
                    Text("Title : "+taskItme[indexId].title,style: TextStyle(fontSize: 16),),
                    const SizedBox(height: 10),
                    Text("Description : "+taskItme[indexId].description,style: TextStyle(fontSize: 16),),
                    const SizedBox(height: 10),
                    Text("Day Required: "+taskItme[indexId].deadline+" day",style: TextStyle(fontSize: 16),),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: (){
                        taskItme.removeAt(indexId);
                        if(mounted){
                          setState(() {});
                        }
                        Navigator.pop(context);
                      },
                      child: const Text('Delete'),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
  


}

class listItem {
  String title,description,deadline;
  listItem(this.title,this.description,this.deadline);
}