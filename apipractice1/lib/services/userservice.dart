import '../Constants/app_config.dart';
import 'package:http/http.dart' as http;

import '../UtilitiesAndComponent/api_response_Exceptions.dart';
class UserService {
  // users?page=2"

  Future <http.Response> getUser(dynamic user) async {

    var response = await http.get(
        Uri.parse(WebUrl +"$user"),
        headers: <String,String>{
          'Content-Type': 'application/json; charset=utf-8',
        },

    );
    APIResponse.exceptionMiddleware(response);
    return response;


  }
}