import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../widgets/product/product_grid_builder.dart';
import '../components/app_drawer.dart';


class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}
class _MainScreenWidgetState extends State<MainScreenWidget> {

  @override
  void initState() {
    Provider.of<Products>(context,listen: false)
        .fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Braids"),
          centerTitle: true,
        ),
        drawer: const AppBarMenu(),
        body: const ProductGridBuilder()
    );
  }
}

