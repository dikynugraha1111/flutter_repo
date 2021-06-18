import 'dart:math';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:bloc/bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Random r = Random();
    ProductBloc bloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      appBar: new AppBar(
        title: new Text("ListView Bloc"),
      ),
      body: Column(
        children: [
          new ElevatedButton(
              onPressed: () {
                bloc.add(r.nextInt(4) + 2);
              },
              child: new Text("Random")),
          BlocBuilder<ProductBloc, List<Product>>(
            builder: (context, products) => Expanded(
              child: new ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return new Text(index.toString());
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class Product {
  String nomor;

  Product({this.nomor = ""});
}

class ProductBloc extends Bloc<int, List<Product>> {
  ProductBloc() : super([]);

  @override
  Stream<List<Product>> mapEventToState(int event) async* {
    List<Product> products = [];
    for (int i = 0; i < event; i++) {
      products.add(Product(nomor: i.toString()));
    }
    yield products;
  }
}
