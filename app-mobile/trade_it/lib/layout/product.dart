import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Image.asset(
            "assets/images/product.jpg",
            fit: BoxFit.cover,
            height: 150,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text("Kikon Camera"),
                    Spacer(),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "8500 EGP",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.black54, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Chip(
                      label: Text(
                        "Electronics",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    const Spacer(),
                    Chip(
                      label: Text(
                        "Trade",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
