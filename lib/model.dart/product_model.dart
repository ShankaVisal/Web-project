import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int id;
  final double rating;
  final String price;
  final String details;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.rating,
    required this.price,
    required this.details,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Big sandwich burger",
    image: "assets/images/big-sandwich-hamburger.jpg",
    rating: 4.5,
    price: "Rs.100.00",
    details: "loresm gkjhgkjghki",
  ),
  Product(
    id: 2,
    title: "Chicken pizza with pepper",
    image: "assets/images/chicken-pizza-with-bell-red-yellow-pepper.jpg",
    rating: 3.9,
    price: "Rs.200.00",
    details: "hjgjkhglukhlihoihj;io",
  ),
  Product(
    id: 3,
    title: "Crispy fish nuggets",
    image: "assets/images/crispy-fish-nuggets-served.jpg",
    rating: 4.2,
    price: "Rs.300.00",
    details: "hjkfgjfgkjhlikhjkl",
  ),
  Product(
    id: 4,
    title: "Chicken prawn cheese fish",
    image:
        "assets/images/four-boxes-nuggets-with-chicken-prawn-cheese-fish.jpg",
    rating: 3.9,
    price: "Rs.400.00",
    details: "kjgukgughilihled",
  ),
  Product(
    id: 5,
    title: "French fries",
    image: "assets/images/french-fries.jpg",
    rating: 4.7,
    price: "Rs.500.00",
    details: "uhluihlikjhbkuyfkhjg",
  ),
  Product(
    id: 6,
    title: "Specky burger",
    image: "assets/images/specky-burger.jpg",
    rating: 4.9,
    price: "Rs.600.00",
    details: "hliuhliuhliuguyliuio",
  ),
];
