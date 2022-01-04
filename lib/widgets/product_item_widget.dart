import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/product.dart';
import 'package:flutter_complete_guide/providers/auth.dart';
import 'package:flutter_complete_guide/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final authData = Provider.of<Auth>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black87,
                  height: 60,
                  child: GridTileBar(
                    leading: SizedBox(
                      width:MediaQuery.of(context).size.width * 0.20,
                      child: Consumer<Product>(
                        builder: (ctx, product, _) => IconButton(
                          icon: Icon(
                            product.isFavorite ? Icons.favorite : Icons.favorite_border,
                          ),
                          color: Theme.of(context).accentColor,
                          onPressed: () {
                            product.toggleFavoriteStatus(authData.Token, authData.userId);
                          },
                        ),
                      ),
                    ),
                    title: Text(
                      product.title,
                      textAlign: TextAlign.center,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        cart.addItem(product.id, product.price, product.title);
                        Scaffold.of(context).hideCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Added item to cart!',
                            ),
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'UNDO',
                              onPressed: () {
                                cart.removeSingleItem(product.id);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
        ),
    )
    );
  }
}
