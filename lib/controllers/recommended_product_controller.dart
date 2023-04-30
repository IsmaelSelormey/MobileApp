import 'package:get/get.dart';
import 'package:project/data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';
import '../models/products_model.dart';


class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductsModel> _recommendedProductList=[];
  List<ProductsModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;


  Future<void> getRecommendedProductList()async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      print("got products recommended");
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    }else{
      print("Could not get products recommended");


    }
  }
}