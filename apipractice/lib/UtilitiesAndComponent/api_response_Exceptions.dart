import 'package:http/http.dart' as http;

class APIResponse{

  static void exceptionMiddleware( http.Response resp)
  {
    switch (resp.statusCode)
    {
      case 500:
        throw Exception(resp.reasonPhrase);
      case 502:
        throw Exception(resp.reasonPhrase);
      case 302:
        throw Exception(resp.reasonPhrase);
      default:
    }


  }

}