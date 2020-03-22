import 'package:http/http.dart' as http;

mixin HttpService {

  Future<http.Response> getRequest(String path) {
    return http.get(path);
  }
}