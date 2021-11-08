import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class NewAppScreen extends StatefulWidget {
  static final String path = "NewsAppScreen";
  const NewAppScreen({ Key? key }) : super(key: key);

  @override
  _NewAppScreenState createState() => _NewAppScreenState();
}

class _NewAppScreenState extends State<NewAppScreen> {
 final String uri ="https://jsonplaceholder.typicode.com/users";

 List posts =[];


 Future getPost() async{
   final response = await http.get(Uri.parse(uri));
if(response.statusCode == 200){
  setState(() {
    posts = jsonDecode(response.body);
    print(posts);
  });
}


 }


  @override
  void initState() {
    getPost();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Blog"),),
      body: ListView.builder(
        itemCount: posts.length,


   itemBuilder: (BuildContext context, int index){
          return Card(
            elevation: 10,
            child: ListTile(
              title: Text(posts[index]["username"]),
              subtitle: Text(posts[index]["email"]),
              leading: Text(posts[index]["address"]["street"]),
            ),
          );
        }

),
      
    );
  }
}