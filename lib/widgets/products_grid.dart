import 'package:flutter/material.dart';
import '../providers/products_provider.dart';
import './product_item_widget.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool filter;


  ProductsGrid(this.filter);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final loadedProducts = filter ? productData.favoriteItems :productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        //create: (c) => loadedProducts[index],
        value:loadedProducts[index] ,
          child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
