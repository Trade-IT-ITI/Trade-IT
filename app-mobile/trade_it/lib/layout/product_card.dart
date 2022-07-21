import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/product.dart';
import '../screens/ProductDetails/productDetails_ui.dart';

class ProductCard extends StatelessWidget {
  ProductCard({Key? key, required this.productOBJ}) : super(key: key);
  Product productOBJ;

  @override
  Widget build(BuildContext context) {
    // print("ljskhdcflkjshdlfjkhsdkjfh");
    // print('http://10.0.2.2:5228/Images/' +
    //     productOBJ.productId.toString() +
    //     '/' +
    //     productOBJ.productImages?[0]['name']);
    late var image;
    if (productOBJ.productImages == null ||
        productOBJ.productImages?[0] == null) {
      image = const AssetImage("assets/images/product.png");
    } else {
      image = NetworkImage('http://10.0.2.2:5228/Images/' +
          productOBJ.productId.toString() +
          '/' +
          productOBJ.productImages?[0]['name']);
      // image = NetworkImage('http://localhost:5228/Images/' +
      //     productOBJ.productId.toString() +
      //     '/' +
      //     productOBJ.productImages?[0]['name']);
    }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              product: productOBJ,
            ),
          ),
        );
      },
      child: Material(
        elevation: 4,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(

                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                child: Stack(
                  children: [
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
                  Text(
                    "${productOBJ.price!} EGP",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color.fromARGB(221, 80, 80, 80),
                          fontSize: 18,
                        ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5) +
                        const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.locationDot,
                          size: 24,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            productOBJ.area!['name'] +
                                " , " +
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     IconButton(
                  //       onPressed: () {
                  //         print("Icon Tap");
                  //       },
                  //       icon: const Icon(Icons.chat_rounded),
                  //       color: Theme.of(context).colorScheme.secondary,
                  //       iconSize: 30,
                  //     ),
                  //     IconButton(
                  //       onPressed: () {
                  //         print("Icon Tap");
                  //       },
                  //       icon: const Icon(Icons.phone),
                  //       color: Theme.of(context).colorScheme.secondary,
                  //       iconSize: 30,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
