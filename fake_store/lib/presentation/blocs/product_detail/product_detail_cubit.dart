import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/product_model.dart';
import '../../../data/services/product_detail_service.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final ProductDetailService service;

  ProductDetailCubit(this.service) : super(ProductDetailLoading());

  Future<void> loadProduct(int id) async {
    try {
      final product = await service.fetchProduct(id);
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductDetailError('Failed to load product'));
    }
  }
}
