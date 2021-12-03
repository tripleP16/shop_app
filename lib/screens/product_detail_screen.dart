import 'package:flutter/material.dart';
import '../providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {

  static const routeName = '/product-detail';


  @override
  Widget build(BuildContext context) {
    final productData =  Provider.of<Products>(context, listen: false);
    final productId = ModalRoute.of(context).settings.arguments as String;
    final item = productData.findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
    );
  }
}
