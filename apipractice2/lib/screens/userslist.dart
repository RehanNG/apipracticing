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

  @override
  void initState() {
    UserService userService = new UserService();

    userService.usersFetch().then((value) {

      if(value.statusCode==200){
        var response = jsonDecode(value.body);

        print(response);
        CustomStorage.id=response['data'][0]['id'];
        CustomStorage.email=response['data'][0]['email'];
        CustomStorage.first_name=response['data'][0]['first_name'];
        CustomStorage.last_name=response['data'][0]['last_name'];
        CustomStorage.avatar=response['data'][0]['avatar'];

        print(CustomStorage.id);
      }



    });

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
