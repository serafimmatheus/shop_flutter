import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/card_item.dart';
import 'package:shop/models/cart.dart';

class CardItemWidget extends StatelessWidget {
  final CartItem itemCart;
  const CardItemWidget({super.key, required this.itemCart});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false)
            .removeItem(itemCart.productId);
      },
      key: Key(itemCart.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 10),
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text(itemCart.price.toString()),
              ),
            ),
          ),
          title: Text(itemCart.name),
          subtitle: Text("Total: R\$ ${itemCart.price * itemCart.quantity}"),
          trailing: Text("${itemCart.quantity}x"),
        ),
      ),
    );
  }
}
