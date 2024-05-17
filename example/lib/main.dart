import 'package:api_call_package/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:api_call_package/api_call_package.dart' as api_call_package;
///
///
/// Demo app to call api package [api_call_package]
/// 
/// the package is used for get all products with method [getAllProducts()]
/// 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Api Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Api Call Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "";
  String response = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(response)
                )
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ElevatedButton(onPressed: () => callgetProducts(), child: const Text("Call GetProducts")),
                  ElevatedButton(onPressed: () => callgetProductById(), child: const Text("Call Get Product By Id")),
                  ElevatedButton(onPressed: () => callCategories(), child: const Text("Call Get Categories")),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  Future<void> callgetProducts() async {
    final getAllProducts = await api_call_package.ApiCall.getAllProducts();
    getAllProducts.fold(
      (error) => print('Error api call: $error'),
      (success) => showProducts(success),
    );
  }

  void showProducts(List<ProductModel> list) {
    setState(() {
      title = "Get Products";
      response = "";
      for(var element in list) { 
        response += "\n ${element.toString()}"; 
      } 
    });
  }

  Future<void> callgetProductById() async {
    final getAllProducts = await api_call_package.ApiCall.getProductById(10);
    getAllProducts.fold(
      (error) => print('Error api call: $error'),
      (success) => showProduct(success),
    );
  }

  void showProduct(ProductModel productModel) {
    setState(() {
      title = "Get Product By Id";
      response = "";
      response += productModel.toString(); 
    });
  }

  Future<void> callCategories() async {
    final getAllProducts = await api_call_package.ApiCall.getCategories();
    getAllProducts.fold(
      (error) => print('Error api call: $error'),
      (success) => showCategories(success),
    );
  }

  void showCategories(List<String> categories) {
    setState(() {
      title = "Get Categories";
      response = "";
      response += categories.toString(); 
    });
  }
}
