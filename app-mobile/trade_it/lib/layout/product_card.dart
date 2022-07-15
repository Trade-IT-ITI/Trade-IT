import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  ProductCard({Key? key, required this.productOBJ}) : super(key: key);
  Product productOBJ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/details");
      },
      child: Card(
        elevation: 3,
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
                    // Image.asset(
                    //   "assets/images/product.jpg",
                    // ),
                    // FadeInImage(
                    //   width: double.infinity,
                    //   height: 180,
                    //   placeholder: AssetImage("assets/images/product.png"),
                    //   image: NetworkImage(productOBJ.productImages?[0]['name']),
                    //   // image: productOBJ.productImages![0].name,
                    // ),
                    // Image.network(
                    //   productOBJ.productImages?[0]['name'],
                    //   loadingBuilder: (BuildContext context, Widget child,
                    //       ImageChunkEvent? loadingProgress) {
                    //     if (loadingProgress == null) {
                    //       return child;
                    //     }
                    //     return Center(
                    //       child: CircularProgressIndicator(
                    //         value: loadingProgress.expectedTotalBytes != null
                    //             ? loadingProgress.cumulativeBytesLoaded /
                    //                 loadingProgress.expectedTotalBytes!
                    //             : null,
                    //       ),
                    //     );
                    //   },
                    // ),
                    Row(
                      children: [
                        Chip(
                          label: Text(
                            productOBJ.subcategory!['name'],
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        const Spacer(),
                        Chip(
                          label: Text(
                            productOBJ.status!['name'],
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
                      Expanded(
                        child: Text(
                          productOBJ.title!,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.black87, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "${productOBJ.price!} EGP",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: const Color.fromARGB(221, 80, 80, 80),
                              fontSize: 18,
                            ),
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
                          backgroundImage:
                              AssetImage("assets/images/avatar.jpg"),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: Text(
                            productOBJ.owner!['firstName'] +
                                " " +
                                productOBJ.owner!['lastName'],
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.black54, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Chip(
                  //       label: Text(
                  //         "Trade For Laptop",
                  //         style:
                  //             Theme.of(context).textTheme.bodySmall?.copyWith(
                  //                   color: Colors.white,
                  //                 ),
                  //       ),
                  //       backgroundColor:
                  //           Theme.of(context).colorScheme.secondary,
                  //     ),
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5) +
                        const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.locationDot,
                          size: 30,
                          color: Colors.redAccent,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            productOBJ.area!['name'] +
                                "," +
                                productOBJ.city!['name'],
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.black54, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          print("Icon Tap");
                        },
                        icon: const Icon(Icons.chat_rounded),
                        color: Theme.of(context).colorScheme.secondary,
                        iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () {
                          print("Icon Tap");
                        },
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
      ),
    );
  }
}
