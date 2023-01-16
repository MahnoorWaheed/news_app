import 'package:flutter/material.dart';
import 'package:news_app/src/view/widgets/bottombar_items.dart';

class AppData {
  const AppData._();

  static const dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";


  static List<BottomNavigationItem> bottomNavigationItems =
  [BottomNavigationItem(const Icon(Icons.home), 'Home'),
    BottomNavigationItem(const Icon(Icons.add_shopping_cart_rounded), 'Shopping cart'),
    BottomNavigationItem(const Icon(Icons.favorite), 'Favorite'),
    BottomNavigationItem(const Icon(Icons.person), 'Profile')];
}