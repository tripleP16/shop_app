import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/orders.dart';
import 'package:flutter_complete_guide/widgets/app_drawer.dart';
import 'package:flutter_complete_guide/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool _isLoading = false;
  Future _ordersFuture;

  Future _obtainOrders(){
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }
  @override
  void initState() {
    // TODO: implement initState
    _ordersFuture = _obtainOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: FutureBuilder(
        future: _ordersFuture,
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: Text('An error ocurred'),
              );
            } else {
              return Consumer<Orders>(
                  builder: (ctx, orderData, child) => ListView.builder(
                        itemCount: orderData.orders.length,
                        itemBuilder: (ctx, i) =>
                            OrderItemWidget(orderData.orders[i]),
                      ));
            }
          }
        },
      ),
      drawer: AppDrawer(),
    );
  }
}
