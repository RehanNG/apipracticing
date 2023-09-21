import 'dart:convert';

import 'package:http/http.dart' as http;

import '../appconfig/configfile.dart';

class UserService{
  var id;
      var email;
      var first_name;
      var last_name;
      var avatar;
      var statusCode;
  UserService({this.id, this.email, this.first_name, this.last_name, this.avatar,this.statusCode});

  //get single user
  Future<http.Response> usersFetch() async{
    var response = http.get(Uri.parse(api), headers:
    <String,String>{
      'Content-Type': 'application/json; charset=utf-8',
    }
    );
    return response;
  }


  //get users as list
  UserService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    avatar = json['avatar'];
  }

  // Future<List<UserService>> getUsersListData() async{
  //   var url = Uri.parse(api);
  //   final response = await http.get(url
  //       ,headers: {'Content-Type': 'application/json; charset=utf-8',}
  //   );
  //   final List body = json.decode(response.body);
  //   return body.map((e) => UserService.fromJson(e)).toList();
  // }


  Future<List<UserService>> getUsersListData() async {
    var url = Uri.parse(api);
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );

    final dynamic body = json.decode(response.body);

    if (body is List) {
      // Handle JSON array response
      return body.map((e) => UserService.fromJson(e)).toList();
    } else if (body is Map<String, dynamic>) {
      // Handle JSON object response
      if (body.containsKey('data')) {
        final dynamic data = body['data'];
        if (data is List) {
          return data.map((e) => UserService.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [UserService.fromJson(data)];
        }
      }
    }

    throw Exception('Invalid API response');
  }

}

