import 'package:product_app/model/product_model.dart';

abstract class CommonState{}
class CommonInitialState extends CommonState{}
class CommonLoadingState extends CommonState{}
class CommonErrorState extends CommonState{
  final String msg;
  CommonErrorState({required this.msg});
}
class CommonSuccessState extends CommonState{
  ProductModel productModel;
  CommonSuccessState({required this.productModel});
}