import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/local_storage.dart';
import '../services/userservice.dart';
class API_Response extends StatefulWidget {
  const API_Response({Key? key}) : super(key: key);

  @override
  State<API_Response> createState() => _API_ResponseState();
}

class _API_ResponseState extends State<API_Response> {

  TextEditingController kuchBheCont = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    kuchBheCont.text = "initial value";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [


            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              UserService userserv = new UserService();

              userserv.getUser(0).then((value){
                var decode=jsonDecode(value.body);
                // kuchBheCont.text=decode['id'].toString();
                CustomStorage.id=decode['data'][0]['id'];
                print("id is: ${CustomStorage.id}");
                CustomStorage.email=decode['data'][0]['email'];
                print("email is: ${CustomStorage.email}");
                CustomStorage.avatar=decode['data'][0]['avatar'];
                print("avatar link: ${CustomStorage.avatar}");
                // CustomStorage.email=decode['data'];
                // CustomStorage.firstName=decode['first_name'];
                // CustomStorage.lastName=decode['last_name'];
                // CustomStorage.avatar=decode['avatar'];


              });
            }, child: Text("get response")),

            Text("${kuchBheCont.text=CustomStorage.avatar}"),

            Image(image: NetworkImage("${CustomStorage.avatar}")),

          ],
        ),
      )
    );
  }
}
