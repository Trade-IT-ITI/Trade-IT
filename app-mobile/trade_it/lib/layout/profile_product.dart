import 'package:flutter/material.dart';

class ProductProfileCard extends StatelessWidget {
  ProductProfileCard(
      {Key? key,
      required this.price,
      required this.imageUrl,
      this.inStock = true,
      required this.productName})
      : super(key: key);

  String productName, imageUrl;
  bool inStock;
  double price;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 10.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: 100,
            fit: BoxFit.cover,
            height: 130,
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName),
                Text(
                  "Obour , Cairo",
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  "15 - 7 - 2022",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Row(
                  children: [
                    Chip(
                      label: Text(
                        "Sold",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Chip(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      label: Text(
                        "Laptops",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 120,
            padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  price.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
                const Text(
                  " EGP",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
