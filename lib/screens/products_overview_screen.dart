import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/bedgee.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewScreen extends StatelessWidget {
  ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Minha loja",
          ),
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text(
                    "Somente favoritos",
                  ),
                  value: FilterOptions.Favorite,
                ),
                PopupMenuItem(
                  child: Text(
                    "Todos",
                  ),
                  value: FilterOptions.All,
                ),
              ],
              onSelected: (FilterOptions selected) {
                if (selected == FilterOptions.Favorite) {
                  provider.showFavoriteOnly();
                } else {
                  provider.showAll();
                }
              },
            ),
            Consumer<Cart>(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.CART,
                  );
                },
                icon: Icon(Icons.shopping_cart),
              ),
              builder: (ctx, cart, child) => Bedgee(
                value: cart.itemsCount.toString(),
                child: child!,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ProductGrid(),
        ));
  }
}
