import 'package:flutter/material.dart';
import './home_page.dart';
// import './home_page.dart';
import './info.dart';

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  String name;
  String dob;
  String image;
  String account;
  String username;
  Future method;
  SecondPage(
      {required this.name,
      required this.dob,
      required this.image,
      required this.account,
      required this.username,
      required this.method});
  // const SecondPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePage = HomePage();
    Widget show(String data1, String data) {
      return Row(
        children: <Widget>[
          Text(
            data1 + ": ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            data,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Internship'),
      ),
      body:
          // Column(
          //   children: <Widget>[
          //     Image.network(image),
          //     const SizedBox(
          //       height: 15,
          //     ),
          //     show("Name", name),
          //     const SizedBox(
          //       height: 15,
          //     ),
          //     show("UserName", username),
          //     const SizedBox(
          //       height: 15,
          //     ),
          //     show("DOB", dob),
          //     const SizedBox(
          //       height: 15,
          //     ),
          //     show("Account Created On", account),
          Container(
        child: FutureBuilder(
            future: method,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: const Text('Loading'),
                );
              } else {
                return 
                    
                       Column(
                        children: [
                          Column(
                            children: <Widget>[
                             ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.network(
        image,
       
    ),),
                              const SizedBox(
                                height: 15,
                              ),
                              show("Name", name),
                              const SizedBox(
                                height: 15,
                              ),
                              show("UserName", username),
                              const SizedBox(
                                height: 15,
                              ),
                              show("DOB", dob),
                              const SizedBox(
                                height: 15,
                              ),
                              show("Account Created On", account),
                            ],
                          ),
                          SizedBox(height: 12,),
                          Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    margin: const EdgeInsets.all(5),
                                    
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        
                                        children: <Widget>[
                                         // ignore: prefer_const_literals_to_create_immutables
                                         Row(children: <Widget>[
                                           Expanded(child: const Text('Looking For',style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                                           const SizedBox(
                                              width: 10,
                                           ),
                                           Expanded(child: const Text('Location',style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                                         ],),
                                         SizedBox(height: 5),
                                         Row(children: <Widget>[
                                           Expanded(child: Text(snapshot.data[index].profession)),
                                           const SizedBox(width: 10,),
                                           Expanded(child: Text(snapshot.data[index].location)),
                                         ],),
                                          SizedBox(height: 10),
                                         // ignore: prefer_const_literals_to_create_immutables
                                         Row(children: [
                                            Expanded(child: const Text('Experience',style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                                           const SizedBox(
                                              width: 10,
                                           ),
                                           Expanded(child: const Text('Skills',style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                                         ],),
                                          SizedBox(height: 5),
                                         Row(children:<Widget> [
                                            Expanded(child: Text(snapshot.data[index].experience.toString())),
                                           const SizedBox(width: 10,),
                                           Expanded(child: Text(snapshot.data[index].skills),),
                                         ],),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      );
                    
                  
                
              }
            }),
      ),
    );
  }
}
