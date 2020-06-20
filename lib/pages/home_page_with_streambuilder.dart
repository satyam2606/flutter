//import 'package:Myapp/drawer.dart';
import 'package:Myapp/utils/Constants.dart';
import 'package:Myapp/widgets/drawer.dart';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "dart:convert";

class HomePageSB extends StatelessWidget{
  Future getData() async{
    var url ="https://jsonplaceholder.typicode.com/photos";
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    print(data);
    return data;
  }

Stream<List<String>> getStreamData(){
  var data= Stream<List<String>>.fromIterable([
    List<String>.generate(20, (index) =>"item $index" ),
  ]
    
  );
  return data;
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
      body: StreamBuilder(
        stream: getStreamData(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            return Center(child: Text("Fetch Something"),
            );
            case ConnectionState.active:
            case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
             case ConnectionState.done:
             if(snapshot.hasError){
               return Center(
                 child: Text("Some error occured"),
               );
             }
             return ListView.builder(
                   itemBuilder: (context, index){
                     return Padding(
                       padding: const EdgeInsets.all(14.0),
                       child: ListTile(
                         title: Text(snapshot.data[index]),
                        //  subtitle: Text("ID: ${snapshot.data[index]['id']}"),
                        //  leading: Image.network(snapshot.data[index]['url']),
                       ),
                     );
                   },
                   itemCount: snapshot.data .length,
                   );



          }
        },
      ),
      
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // myText = _nameController.text;
        // setState(() {
          
        // });
      },
      child: Icon(Icons.refresh),
       ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      
      );
    
  }
}
