import 'package:dartz/dartz.dart';
import 'package:wink/core/utils/exceptions/exceptions.dart';
import 'package:wink/features/shop/domain/entities/product_entity.dart';
import 'package:wink/features/shop/domain/repository/shop_repository.dart';

class GetProductsByCategoryUsecase {
  final ShopRepository shopRepository;

  GetProductsByCategoryUsecase({required this.shopRepository});

  Future<Either<TExceptions, List<ProductEntity>>> call(
      {required String categoryName}) async {
    return await shopRepository.getProductsByCategory(
        categoryName: categoryName);
  }
}
