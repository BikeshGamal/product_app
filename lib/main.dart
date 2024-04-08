import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/cubits/product_cubit.dart';
import 'package:product_app/repositories/product_repository.dart';
import 'package:product_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductRepository(),
      child: BlocProvider(
        create: (context) =>
            ProductCubit(productRepository: context.read<ProductRepository>())
              ..getProduct(),
        child: MaterialApp(
          theme: ThemeData.dark(useMaterial3: false),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
