import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sort_it/src/screens/store/components/categoryItem.dart';

class StoreController extends GetxController {
  final List<CategoryItem> categories = [
    CategoryItem(subtitle: 'Hot', icon: '🔥', isselected: true),
    CategoryItem(subtitle: 'Woman', icon: '👚', isselected: false),
    CategoryItem(subtitle: 'Man', icon: '👕', isselected: false),
    CategoryItem(subtitle: 'Shoes', icon: '👟', isselected: false),
  ];
}
