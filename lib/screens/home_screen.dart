import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/cubits/common_state.dart';
import 'package:product_app/cubits/product_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Product App"),
      ),
      body: BlocBuilder<ProductCubit, CommonState>(
        builder: (context, state) {
          if (state is CommonLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CommonErrorState) {
            return Center(
              child: Text(state.msg),
            );
          } else if (state is CommonSuccessState) {
            return ListView.builder(
              itemCount: state.productModel.products!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      state.productModel.products![index].images![0].toString(),
                      height: 100,
                      width: 100,
                    ),
                    title: Text("${state.productModel.products![index].title}"),
                    subtitle:
                        Text(state.productModel.products![index].description!),
                  ),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
