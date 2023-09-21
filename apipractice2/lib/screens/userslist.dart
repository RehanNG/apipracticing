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

        // print(CustomStorage.id);
        // print(CustomStorage.email);
        // print(CustomStorage.first_name);
        // print(CustomStorage.last_name);
        // print(CustomStorage.avatar);


        // List list = [CustomStorage.id,CustomStorage.email,CustomStorage.first_name,CustomStorage.last_name,CustomStorage.avatar];
        //
        // for(int i=0;i<list.length;i++){
        //   print(list[i]);
        // }




      }



    });
  }
//
//   void getUsersList(){
//
//     //index starts from 0 ends to 5
//
//     UserService userService = new UserService();
//
//     userService.usersFetch().then((value){
//
//       if(value.statusCode==200){
//
//         List<UserService> userList = [];
//         var response = jsonDecode(value.body);
//         print(response);
//         var userData = response['data'];
//         for (var data in userData) {
//           UserService user =UserService(
//             id: data['id'],
//             email: data['email'],
//             first_name: data['first_name'],
//             last_name: data['last_name'],
//             avatar: data['avatar'],
//           );
//
//           userList.add(user);
//           CustomStorage.usersListLength = userList.length;
//           CustomStorage.usersList = userList;
//           CustomStorage.userdata = userData;
//           print("custom storage main response  ${CustomStorage.userdata = userData}");
//         }
// setState(() {
//
// });
//       }
//
//
//
//
//     });
//
//
//   }

  @override
  void initState() {
//     print("for default hard coated rsponse");
//     getResponses();
// print("for specific index response");
//     getSpecificResponses(2);

    getAllUsersListData();
    super.initState();
  }

  List<UserService> userList = [];
  Future<void> getAllUsersListData() async {
    UserService userService = UserService();
    List<UserService> users = await userService.getUsersListData();
    setState(() {
      userList = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            UserService user = userList[index];
            return ListTile(
              title: Text(user.first_name+''+user.last_name),
              subtitle: Text(user.email),
            );
          }),
    );
  }
}
