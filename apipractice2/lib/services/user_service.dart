import 'package:http/http.dart' as http;

import '../appconfig/configfile.dart';

class UserService{

  UserService({dynamic id, dynamic email, dynamic first_name, dynamic last_name, dynamic avatar, dynamic statusCode});
  Future<http.Response> usersFetch() async{
    var response = http.get(Uri.parse(api), headers:
    <String,String>{
      'Content-Type': 'application/json; charset=utf-8',
    }
    );
    return response;
  }


}