import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:https_demo_app/product.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const HomeScreenAlternate(),
    ),
  );
}

class HomeScreenAlternate extends StatelessWidget {
  const HomeScreenAlternate({Key? key}) : super(key: key);

  Future<List<Product>> getProducts() async {
    List<Product> products = [];

    Uri url = Uri.https("dummyjson.com", "products");
    final response = await http.get(url);
    final dataAsJson = (json.decode(response.body))["products"];
    for (Map<String, Object?> json in dataAsJson) {
      products.add(Product.fromJson(json));
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Http Response"),
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SizedBox(
              child: Text("error"),
            );
          }
          if (!snapshot.hasData) {
            return const SizedBox(
              child: Text("no data"),
            );
          }
          final products = snapshot.requireData;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(
                    products[index].title,
                  ),
                  Image.network(
                    products[index].thumbnail,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {
    Uri url = Uri.https("dummyjson.com", "products");
    final response = await http.get(url);
    final dataAsJson = (json.decode(response.body))["products"];
    for (Map<String, Object?> json in dataAsJson) {
      products.add(Product.fromJson(json));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Http Response"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(
                products[index].title,
              ),
              Image.network(
                products[index].thumbnail,
              ),
            ],
          );
        },
      ),
    );
  }
}
