import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  // late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    // token = AppConstant.TOKEN;
    // _mainHeaders = {
    //   'Content-type': 'application/json; charset=UTF-8',
    //   'Authorization': 'Bearer $token',
    // };
  }

  // void updateHeaders(String token) {
  //   _mainHeaders = {
  //     'Content-type': 'application/json; charset=UTF-8',
  //     'Authorization': 'Bearer $token',
  //   };
  // }

  // Future<Response> getData(String uri) async {
  //   try {
  //     Response response = await get(uri);
  //     print("from api client ${response.statusCode}");

  //     var result = response.body;

  //     return result;
  //   } catch (e) {
  //     return Response(statusCode: 1, statusText: e.toString());
  //   }
  // }
}
