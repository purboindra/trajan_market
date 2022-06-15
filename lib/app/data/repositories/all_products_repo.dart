import 'package:get/get.dart';
import 'package:trajan_market/app/data/api/api_client.dart';

class AllProductRepository extends GetxService {
  final ApiClient apiClient;

  AllProductRepository({required this.apiClient});

  // Future<Response> getPopularProductList() async {
  //   return await apiClient.getData(AppConstant.GET_ALL_PRODUCTS);
  // }
}
