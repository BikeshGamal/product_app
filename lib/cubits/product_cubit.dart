import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/cubits/common_state.dart';
import 'package:product_app/repositories/product_repository.dart';

class ProductCubit extends Cubit<CommonState> {
  ProductRepository productRepository;
  ProductCubit({required this.productRepository}) : super(CommonInitialState());
  emit(CommonLoadingState);
  getProduct() async {
    var model = await productRepository.getProduct();
    model!.fold((err) => emit(CommonErrorState(msg: err)),
        (data) => emit(CommonSuccessState(productModel: data)));
  }
}
