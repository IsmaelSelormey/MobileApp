import 'package:project/controllers/popular_product_controller.dart';
import 'package:project/data/api/api_class.dart';
import 'package:get/get.dart';
import 'package:project/data/repository/popular_product_repo.dart';
Future<void> init()async{
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: "appBaseUrl"));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  
  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}