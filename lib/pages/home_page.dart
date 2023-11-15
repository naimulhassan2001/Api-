

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  TextEditingController nameController = TextEditingController() ;
  TextEditingController emailController = TextEditingController() ;
  TextEditingController mobileController = TextEditingController() ;


  Future insertData(String name, String email, String mobile) async {

    // https://xpart.top/developer/insert.php?name=shanto&email=shant@gmail.com&mobile=01865924385

    final url = Uri.parse('https://xpart.top/developer/insert.php?name=$name&email=$email&mobile=$mobile');
    var response =await http.get(url) ;
    nameController.clear() ;
    emailController.clear() ;
    mobileController.clear() ;

    return jsonDecode(response.body) ;


  }


  Future loadData() async {
    final url = Uri.parse('https://xpart.top/developer/load.php');
    var response = await http.get(url) ;
    return jsonDecode(response.body) ;

  }


  Future updateData(String name, String email, String mobile) async{
    //https://xpart.top/developer/update.php?name=swapon&email=swapon@gmail.com&mobile=0179685354
    final url = Uri.parse('https://xpart.top/developer/update.php?name=$name&email=$email&mobile=$mobile') ;
    var response = await http.get(url);

    nameController.clear();
    emailController.clear();
    mobileController.clear();

    return jsonDecode(response.body);
  }


Future deleteData(String email) async {
    final url = Uri.parse('https://xpart.top/developer/delete.php?email=$email') ;

    var response = await http.get(url) ;

    nameController.clear();
    emailController.clear();
    mobileController.clear();


    return jsonDecode(response.body) ;
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Calling'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: mobileController,
              decoration: InputDecoration(
                labelText: 'Mobile',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(onPressed: () {
                  updateData(nameController.text, emailController.text, mobileController.text) ;
                  loadData() ;
                  },
                    child: const Text('Update')),
                const SizedBox(width: 10,),
                ElevatedButton(onPressed: () => insertData(nameController.text, emailController.text, mobileController.text),
                    child: const Text('Insert Data')),
                const SizedBox(width: 10,),
                ElevatedButton(onPressed: () {
                  deleteData(emailController.text);
                  loadData() ;
                },


                    child: const Text('Delete')),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: FutureBuilder(
                future: loadData(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {


                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          var datas = snapshot.data[index] ;
                          return ListTile(
                            title: Text(datas['name']),
                            subtitle: Text(datas['email']),
                          );


                        },);

                  }
                  return const Center(child: CircularProgressIndicator()) ;
                },),
          )
        ],
      ),
    );
  }
}
