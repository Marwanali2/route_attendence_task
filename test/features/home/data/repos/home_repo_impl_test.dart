import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:route_attendence_task/features/home/data/data_sources/home_local_data_source.dart';
import 'package:route_attendence_task/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:route_attendence_task/features/home/data/repos/home_repo_impl.dart';
import 'package:route_attendence_task/features/home/domain/entities/product_entity.dart';

class MockHomeLocalDataSource extends Mock implements HomeLocalDataSource {}

class MockHomeRemoteDataSource extends Mock implements HomeRemoteDataSource {}

void main() {
  late HomeRepoImpl repository;
  late MockHomeLocalDataSource mockHomeLocalDataSource;
  late MockHomeRemoteDataSource mockHomeRemoteDataSource;

  setUp(() {
    mockHomeLocalDataSource = MockHomeLocalDataSource();
    mockHomeRemoteDataSource = MockHomeRemoteDataSource();
    repository = HomeRepoImpl(
      homeLocalDataSource: mockHomeLocalDataSource,
      homeRemoteDataSource: mockHomeRemoteDataSource,
    );
  });

  final List<ProductEntity> tProducts = [
    ProductEntity(
      productImageThumbnail: 'image1.png',
      productImage: 'image.png',
      productTitle: 'Test Product 1',
      productDescription: 'Test Description 1',
      productdiscountPercentage: 10,
      productPrice: 100,
      productRatring: 4.5,
    ),
   
  ];

  test('should return product list from local data source when it exists', () async {
    // arrange
    when(mockHomeLocalDataSource.fetchProducts()).thenReturn(tProducts);

    // act
    final result = await repository.fetchProducts();

    // assert
    verify(mockHomeLocalDataSource.fetchProducts());
    expect(result, Right(tProducts));
  });

  test('should return product list from remote data source when local is empty', () async {
    // arrange
    when(mockHomeLocalDataSource.fetchProducts()).thenReturn([]);
    when(mockHomeRemoteDataSource.fetchProducts()).thenAnswer((_) async => tProducts);

    // act
  });}