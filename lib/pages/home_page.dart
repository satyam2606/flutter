//import 'package:Myapp/drawer.dart';
import 'package:Myapp/utils/Constants.dart';
import 'package:Myapp/widgets/drawer.dart';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "dart:convert";
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController=TextEditingController();
  var myText="Change me";
  var url ="https://jsonplaceholder.typicode.com/photos";
  var data;
  @override
  
  void initState() { 
    super.initState();
    getData();
  }
  getData() async{
    var res = await http.get(url);
    data = jsonDecode(res.body);
    print(data);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Satyam's app"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {
            
            Constants.prefs.setBool("loggedIn" , false);
            Navigator.pushReplacementNamed(context, "/login");
          },)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
                child: data!=null
                 ? ListView.builder(
                   itemBuilder: (context, index){
                     return Padding(
                       padding: const EdgeInsets.all(14.0),
                       child: ListTile(
                         title: Text(data[index]['title']),
                         subtitle: Text("ID: ${data[index]['id']}"),
                         leading: Image.network(data[index]['url']),
                       ),
                     );
                   },
                   itemCount: data.length
                   )
                 :Center(child:CircularProgressIndicator() ),
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
