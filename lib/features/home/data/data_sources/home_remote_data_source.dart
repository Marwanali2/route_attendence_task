import 'package:route_attendence_task/core/utils/api_services.dart';
import 'package:route_attendence_task/core/utils/constants.dart';
import 'package:route_attendence_task/core/utils/functions/cache_products_box.dart';
import 'package:route_attendence_task/features/home/data/models/product_model/product_model.dart';
import 'package:route_attendence_task/features/home/domain/entities/product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductEntity>> fetchProducts();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);

  @override
  Future<List<ProductEntity>> fetchProducts() async {
    var data = await apiServices.getHomeProducts(endPoint: 'products');
    List<ProductEntity> products = getProductsList(data);
    cacheProductsBox(products, kProductsBox);
    return products;
  }

  List<ProductEntity> getProductsList(Map<String, dynamic> data) {
    List<ProductEntity> products = [];
    for (var productMap in data['products']) {
      products.add(ProductModel.fromJson(productMap));
    }
    return products;
  }
}
