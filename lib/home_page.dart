import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internship/info.dart';
import 'package:internship/second_page.dart';
import './second_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  TextEditingController name = TextEditingController();
  
  final form = GlobalKey<FormState>();
   String a1='';
   String b1='';
   String c1='';
   String d1='';
   String e1='';

  @override
  Widget build(BuildContext context) {
    Future getData() async {
      var response = await http
          .get(Uri.https("py.crewbella.com", "user/api/profile/chiragbalani"));
      var jsonData = jsonDecode(response.body);

      String a = jsonData['basic']['name'];
      a1 = a;
      String b = jsonData['basic']['dob'];
      b1 = b;
      String c = jsonData['basic']['image'];
      c1 = c;
      String d = jsonData['basic']['created_at'];
      d1 = d;
      String e = jsonData['basic']['username'];
      e1 = e;
      List<Info> dataSet = [];
      for (int i = 0; i < 4; i++) {
        Info info = Info(
            location: jsonData['client_postings'][i]['location'],
            skills: jsonData['client_postings'][i]['skills'] == null?'null':jsonData['client_postings'][i]['skills'],
            profession:jsonData['client_postings'][i]['profession'],
         experience: jsonData['client_postings'][i]['experience'],);
          
           
            dataSet.add(info);
            

      }
      return dataSet;
      //  for(int i =0;i<4;i++){
      //    print(dataSet[i].location);
      //  }
     
     
      // return dataSet;
    }
      
    void move(){
         final String name1 = name.text;
        if(name1 == a1){
           Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>   SecondPage(name: a1,dob:b1 ,image: c1,account:d1,username:e1,method: getData(),),),
      );
        }
        else {
         showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
          title: Text('An Error Occured!'),
          content: Text('Enter valid name eg Chirag Balani'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text('Okay'),
            )
          ]),
    );
        }
    }
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Internship'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Form(
              key: form,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Enter Name'),
                controller: name,
                validator: ( String ?value) {
                  if (name.text!.isEmpty) {
                    return 'Enter Name';
                  }
                  return null;
                },
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            getData();
            move();
          }, child: const Text('Submit')),
        ],
      ),
    );
  }
}
