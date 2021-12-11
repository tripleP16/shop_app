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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
              )
            ),
            SizedBox(
              height: 10,
            ),
            Text('\$${item.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 10
              ),
              child: Text(
                item.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      )
    );
  }
}
