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
  List<ProductModel> listProducts = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final getAllProducts = await api_call_package.ApiCall().getAllProducts();
    getAllProducts.fold(
      (error) => print('Error api call: $error'),
      (success) => showProducts(success),
    );
  }

  void showProducts(List<ProductModel> list) {
    setState(() {
      listProducts = list;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: listProducts.length,
            itemBuilder: (context, index) {
              ProductModel productModel = listProducts[index];
              return ListTile(title: Text("${productModel.title}"),);
            },
          ),
      ),
    );
  }
}
