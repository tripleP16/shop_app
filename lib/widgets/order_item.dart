import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/orders.dart';
import 'package:intl/intl.dart';
class OrderItemWidget extends StatelessWidget {
  final OrderItem order;


  OrderItemWidget(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(
                DateFormat('dd MM yyyy hh:mm').format(order.dateTime)
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
