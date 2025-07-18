import 'package:dartz/dartz.dart';
import 'package:wink/core/utils/exceptions/exceptions.dart';
import 'package:wink/features/shop/domain/entities/product_entity.dart';
import 'package:wink/features/shop/domain/repository/shop_repository.dart';

class GetProductByIdUsecase {
  final ShopRepository shopRepository;

  GetProductByIdUsecase({required this.shopRepository});

  Future<Either<TExceptions, ProductEntity>> call({required int productId}) async {
    return await shopRepository.getProductById(productId: productId);
  }
}
