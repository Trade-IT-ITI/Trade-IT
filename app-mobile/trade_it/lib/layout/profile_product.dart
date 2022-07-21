import 'package:flutter/material.dart';

import '../models/product.dart';
import '../screens/ProductDetails/productDetails_ui.dart';

class ProductProfileCard extends StatelessWidget {
  ProductProfileCard({
    Key? key,
    required this.productOBJ,
  }) : super(key: key);

  Product productOBJ;
  @override
  Widget build(BuildContext context) {
    DateTime productDateTime = DateTime.parse(productOBJ.postDateTime ?? "");
    String productDate =
        "${productDateTime.day} - ${productDateTime.month} - ${productDateTime.year}";
    String imgPath =
        'http://10.0.2.2:5228/Images/' + productOBJ.productId.toString() + '/';
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              productID: productOBJ.productId!,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        shadowColor: Colors.black,
        elevation: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            productOBJ.productImages == null ||
                    productOBJ.productImages!.isEmpty
                ? const SizedBox(
                    width: 0,
                  )
                : Image.network(
                    imgPath + productOBJ.productImages![0]["name"],
                    width: 100,
                    fit: BoxFit.cover,
                    height: 130,
                  ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productOBJ.title ?? ""),
                  Text(
                    "${productOBJ.area == null ? "" : productOBJ.area["name"]} , ${productOBJ.city == null ? "" : productOBJ.city["name"]} ",
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    productDate,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Row(
                    children: [
                      Chip(
                        label: Text(
                          productOBJ.status == null
                              ? ""
                              : productOBJ.status["name"],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Chip(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        label: Text(
                          productOBJ.subcategory == null
                              ? ""
                              : productOBJ.subcategory["name"],
                          style: const TextStyle(
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
                    (productOBJ.price ?? 0.0).toString(),
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
      ),
    );
  }
}
