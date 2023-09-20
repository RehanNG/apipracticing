import '../Constants/app_config.dart';
import 'package:http/http.dart' as http;

import '../UtilitiesAndComponent/api_response_Exceptions.dart';
class UserService {
  // users?page=2"

  Future <http.Response> getUser(dynamic data) async {

    var response = await http.get(
        Uri.parse(WebUrl +"users?data=$data"),
        headers: <String,String>{
          'Content-Type': 'application/json; charset=utf-8',
        },

    );
    APIResponse.exceptionMiddleware(response);
    return response;


  }
}