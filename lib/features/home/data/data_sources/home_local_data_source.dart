import 'package:hive_flutter/hive_flutter.dart';
import 'package:route_attendence_task/core/utils/constants.dart';
import 'package:route_attendence_task/features/home/domain/entities/product_entity.dart';

abstract class HomeLocalDataSource {
  List<ProductEntity> fetchProducts();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  

  HomeLocalDataSourceImpl();

  @override
  List<ProductEntity> fetchProducts() {
    var box = Hive.box<ProductEntity>(kProductsBox);
    return box.values.toList();
  }
}
