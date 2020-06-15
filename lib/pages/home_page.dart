import 'package:Myapp/ChangeNameCard.dart';
import 'package:Myapp/drawer.dart';
import "package:flutter/material.dart";
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController=TextEditingController();
  var myText="Change me";
  @override
  
  void initState() { 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Satyam's app"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
        child: Card(
          
          child: ChangeNameCard(myText: myText, nameController: _nameController),
        ),
                ),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        myText = _nameController.text;
        setState(() {
          
        });
      },
      child: Icon(Icons.refresh),
       ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      
      );
    
  }
}
