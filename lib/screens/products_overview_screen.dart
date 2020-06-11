import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _onlyFavs = false;

  @override
  Widget build(BuildContext context) {
    //final productsContainer = Provider.of<Products>(context, listen: false);
    //final productsData = Provider.of<Products>(context);
    //final products = _onlyFavs ? productsData.favorites : productsData.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selval) {
              setState(() {
                if (selval == FilterOptions.Favorites) {
                  //productsContainer.showFavoritesOnly();

                  _onlyFavs = true;
                } else {
                  //productsContainer.showAll();
                  _onlyFavs = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilterOptions.Favorites),
              PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
            ],
          )
        ],
      ),
      body: ProductsGrid(_onlyFavs),
    );
  }
}
