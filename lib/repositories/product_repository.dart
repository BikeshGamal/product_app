import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:product_app/model/product_model.dart';

class ProductRepository{
  Future<Either<String,ProductModel>?> getProduct() async{
    try{
    Dio dio=Dio();
    var response=await dio.get("https://dummyjson.com/products");
    if(response.statusCode==200)
    {
      var model=ProductModel.fromJson(jsonDecode(response.toString()));
      return Right(model);
    }
    else{
      return null;
    }
    }on DioException catch(e)
    {
      return Left(e.message.toString());
    }
    on Exception catch(e)
    {
      return Left(e.toString());
    }

  }
}