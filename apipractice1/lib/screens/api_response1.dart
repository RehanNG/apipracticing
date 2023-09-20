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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              UserService userserv = new UserService();

              userserv.getUser(2).then((value){

                //this condition is necessary to get the response , if we will not do so big error will come directly
                if(value.statusCode==200){
                  CustomStorage.statusCode=value.statusCode;
                  var decode=jsonDecode(value.body);
                  print(decode);
                  // kuchBheCont.text=decode['id'].toString();

                  CustomStorage.avatar=decode['data']['avatar'];
                  CustomStorage.id=decode['data']['id'];
                  CustomStorage.firstName=decode['data']['first_name'];
                  CustomStorage.lastName=decode['data']['last_name'];
                  CustomStorage.email=decode['data']['email'];

                  CustomStorage.supporturl=decode['support']['url'];
                  CustomStorage.supporttext=decode['support']['text'];
                 setState(() {});   // Trigger a rebuild to update the UI
                }




              });
            }, child: Text("get response")),

            // Text("${kuchBheCont.text=CustomStorage.avatar}"),


            CustomStorage.statusCode!=200 ? Text("waiting for response")   :     ClipRRect( borderRadius:BorderRadius.circular(360), child: Image(image: NetworkImage("${ CustomStorage.avatar}") )),
            CustomStorage.statusCode!=200 ? Text("waiting for response")   :     Center(child: Text(" Id : ${CustomStorage.id}")),
            CustomStorage.statusCode!=200 ? Text("waiting for response")   :     Center(child: Text(" First Name :  ${CustomStorage.firstName}")),
            CustomStorage.statusCode!=200 ? Text("waiting for response")   :     Center(child: Text(" Last Name  :${CustomStorage.lastName}")),
            CustomStorage.statusCode!=200 ? Text("waiting for response")   :     Center(child: Text(" Email : ${CustomStorage.email}")),
            CustomStorage.statusCode!=200 ? Text("waiting for response")   :     SingleChildScrollView(scrollDirection: Axis.vertical, child: SizedBox(width: 180,height: 60, child: Center(child: Text(" Support url: \n ${CustomStorage.supporturl}")))),
            CustomStorage.statusCode!=200 ? Text("waiting for response")   :     SingleChildScrollView(scrollDirection: Axis.vertical,child: SizedBox( width: 180, height: 80, child: Center(child: Text(" Support text : \n ${CustomStorage.supporttext}")))),

          ],
        ),
      )
    );
  }

}
