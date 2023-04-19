import 'package:get/get.dart';
import 'package:project/data/api/api_class.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData("end point url");

  }
}