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
      elevation: 2,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/product.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Chip(
                        label: Text(
                          "Electronics",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      const Spacer(),
                      Chip(
                        label: Text(
                          "New",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Kikon Camera",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.black87, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      "8500 EGP",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Color.fromARGB(221, 80, 80, 80), fontSize: 18),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.favorite,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage("assets/images/avatar.jpg"),
                      ),
                      Text(
                        "7amama Elgen",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.black54, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Chip(
                      label: Text(
                        "Trade For Laptop",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chat_rounded),
                      color: Theme.of(context).colorScheme.secondary,
                      iconSize: 30,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.phone),
                      color: Theme.of(context).colorScheme.secondary,
                      iconSize: 30,
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
