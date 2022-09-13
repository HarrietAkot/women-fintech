import 'package:flutter/material.dart';
import 'models/product.dart';

class Constants {
  static const double kpadding = 8.0;
  static final Color textColor = const Color(0xffccc7c5);
}

// mock cart items
final List<Product> cartProducts = [
  Product(
    id: 0,
    name: "Product-1",
    slug: "Product-1",
    category: "Clothes",
    description: "Product-1 description",
    permalink: "https://test.com/Product-1",
    price: 1200.50,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1492707892479-7bc8d5a4ee93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=930&q=80",
  ),
  Product(
    id: 1,
    name: "Product-2",
    slug: "Product-2",
    category: "Creams",
    description: "Product-2 description",
    permalink: "https://test.com/Product-2",
    price: 500,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80",
  ),
  Product(
    id: 2,
    name: "Product-3",
    slug: "Product-3",
    category: "Shoes",
    description: "Product-3 description",
    permalink: "https://test.com/Product-3",
    price: 800,
    lowStockAmount: 50,
    stockStatus: "outofstock",
    image:
        "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=80",
  ),
  Product(
    id: 3,
    name: "Product-4",
    slug: "Product-4",
    category: "Electronics",
    description: "Product-4 description",
    permalink: "https://test.com/Product-4",
    price: 15.30,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmljeWNsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=80",
  ),
  Product(
    id: 4,
    name: "Product-5",
    slug: "Product-5",
    category: "Accessories",
    description: "Product-4 description",
    permalink: "https://test.com/Product-5",
    price: 45.30,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1547447134-cd3f5c716030?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80",
  ),
];

// mock all products
final List<Product> allProducts = [
  Product(
    id: 0,
    name: "Product-1",
    slug: "Product-1",
    category: "Clothes",
    description: "Product-1 description",
    permalink: "https://test.com/Product-1",
    price: 1200.50,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1492707892479-7bc8d5a4ee93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=930&q=80",
  ),
  Product(
    id: 1,
    name: "Product-2",
    slug: "Product-2",
    category: "Creams",
    description: "Product-2 description",
    permalink: "https://test.com/Product-2",
    price: 500,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80",
  ),
  Product(
    id: 2,
    name: "Product-3",
    slug: "Product-3",
    category: "Shoes",
    description: "Product-3 description",
    permalink: "https://test.com/Product-3",
    price: 800,
    lowStockAmount: 50,
    stockStatus: "outofstock",
    image:
        "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=80",
  ),
  Product(
    id: 3,
    name: "Product-4",
    slug: "Product-4",
    category: "Electronics",
    description: "Product-4 description",
    permalink: "https://test.com/Product-4",
    price: 15.30,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmljeWNsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=80",
  ),
  Product(
    id: 4,
    name: "Product-5",
    slug: "Product-5",
    category: "Accessories",
    description: "Product-5 description",
    permalink: "https://test.com/Product-5",
    price: 45.30,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1547447134-cd3f5c716030?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80",
  ),
  Product(
    id: 5,
    name: "Product-6",
    slug: "Product-6",
    category: "Electronics",
    description: "Product-6 description",
    permalink: "https://test.com/Product-6",
    price: 45.30,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1626806787461-102c1bfaaea1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1771&q=80",
  ),
  Product(
    id: 6,
    name: "Product-7",
    slug: "Product-7",
    category: "Electronics",
    description: "Product-7 description",
    permalink: "https://test.com/Product-7",
    price: 45.30,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
  ),
  Product(
    id: 7,
    name: "Product-8",
    slug: "Product-8",
    category: "Phones",
    description: "Product-8 description",
    permalink: "https://test.com/Product-8",
    price: 45.30,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1523206489230-c012c64b2b48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
  ),
  Product(
    id: 8,
    name: "Product-9",
    slug: "Product-9",
    category: "Dairy",
    description: "Product-9 description",
    permalink: "https://test.com/Product-9",
    price: 45.30,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1550583724-b2692b85b150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWlsa3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=80",
  ),
  Product(
    id: 9,
    name: "Product-10",
    slug: "Product-10",
    category: "Meat",
    description: "Product-10 description",
    permalink: "https://test.com/Product-10",
    price: 45.30,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1613454320437-0c228c8b1723?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVlZnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=80",
  ),
  Product(
    id: 10,
    name: "Product-11",
    slug: "Product-11",
    category: "Drinks",
    description: "Product-11 description",
    permalink: "https://test.com/Product-11",
    price: 45.30,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1612528443702-f6741f70a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1780&q=80",
  ),
  Product(
    id: 11,
    name: "Product-12",
    slug: "Product-12",
    category: "Ready to Eat",
    description: "Product-12 description",
    permalink: "https://test.com/Product-12",
    price: 45.30,
    lowStockAmount: 50,
    stockStatus: "instock",
    image:
        "https://images.unsplash.com/photo-1473093226795-af9932fe5856?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1694&q=80",
  ),
];
