import 'dart:convert';

import 'package:apipracticetwo/localStorage/storage.dart';
import 'package:apipracticetwo/services/user_service.dart';
import 'package:flutter/material.dart';
class userslistScreen extends StatefulWidget {
  const userslistScreen({Key? key}) : super(key: key);

  @override
  State<userslistScreen> createState() => _userslistScreenState();
}

class _userslistScreenState extends State<userslistScreen> {

  List<UserService> users = [];

  void getUsersAsList(){

    UserService userService = new UserService();

    userService.usersFetch().then((value) {

      if(value.statusCode==200){
        var response = jsonDecode(value.body);
        // print(response);
        List<dynamic> userData = response['data'];

        setState(() {

         users = userData.map((e) => _mapUser()).toList();

        });







      }



    });
  }

  UserService _mapUser(){
    dynamic values = "${CustomStorage.id}${CustomStorage.email}${CustomStorage.first_name}${CustomStorage.last_name}${CustomStorage.avatar}";
    return values;
  }


  void getResponses(){

    UserService userService = new UserService();

    userService.usersFetch().then((value) {

      if(value.statusCode==200){
        var response = jsonDecode(value.body);
        // print(response);
        CustomStorage.id=response['data'][0]['id'];
        CustomStorage.email=response['data'][0]['email'];
        CustomStorage.first_name=response['data'][0]['first_name'];
        CustomStorage.last_name=response['data'][0]['last_name'];
        CustomStorage.avatar=response['data'][0]['avatar'];

        print(CustomStorage.id);
        print(CustomStorage.email);
        print(CustomStorage.first_name);
        print(CustomStorage.last_name);
        print(CustomStorage.avatar);






      }



    });
  }


  void getSpecificResponses(int index){

    //index starts from 0 ends to 5

    UserService userService = new UserService();

    userService.usersFetch().then((value) {

      if(value.statusCode==200){
        var response = jsonDecode(value.body);
        // print(response);

        CustomStorage.id=response['data'][index]['id'];
        CustomStorage.email=response['data'][index]['email'];
        CustomStorage.first_name=response['data'][index]['first_name'];
        CustomStorage.last_name=response['data'][index]['last_name'];
        CustomStorage.avatar=response['data'][index]['avatar'];

        print(CustomStorage.id);
        print(CustomStorage.email);
        print(CustomStorage.first_name);
        print(CustomStorage.last_name);
        print(CustomStorage.avatar);


        // List list = [CustomStorage.id,CustomStorage.email,CustomStorage.first_name,CustomStorage.last_name,CustomStorage.avatar];
        //
        // for(int i=0;i<list.length;i++){
        //   print(list[i]);
        // }




      }



    });
  }




  @override
  void initState() {
    print("for default hard coated rsponse");
    getResponses();
print("for specific index response");
    getSpecificResponses(2);

    // getUsersAsList();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [





        ],
      ),
    );
  }
}
