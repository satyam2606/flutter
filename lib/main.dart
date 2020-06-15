import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
void main(){
  runApp(MaterialApp(
    title:"Awesome App",
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    )
    ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Satyam's app"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(onPressed: () {},
      child: Icon(Icons.edit),
       ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader(
            //   child: Text(
            //     "Hello I'm drawer",
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       color: Colors.white,
                  
            //     )
            //     ),
            //     decoration: BoxDecoration(
            //       color: Colors.purple,
            //     ),
            //   ),
            UserAccountsDrawerHeader(
              accountName: Text("Satyam Singh"), 
              accountEmail: Text("satyamsingh2606@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQYuOaDdMFWrp7ARD6otVrK4MTFzMjVDEVEHRjy1y4K9jOMc6mU&usqp=CAU"),
            )),
              //),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Account"),
                subtitle: Text("Personal"),
                trailing: Icon(Icons.edit),
              ),
               ListTile(
                leading: Icon(Icons.email),
                title: Text("Email"),
                subtitle: Text("satyamsingh2606@gmail.com"),
                trailing: Icon(Icons.send),
              ),


          ],)
      ),
      );
    
  }
}
    