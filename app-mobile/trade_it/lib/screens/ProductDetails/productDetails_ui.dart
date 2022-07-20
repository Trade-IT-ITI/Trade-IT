import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trade_it/models/user.dart';
import 'package:trade_it/screens/ProductDetails/productDetails_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bloc/bloc_state.dart';
import '../../models/details_product.dart';
import '../../models/user.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({Key? key, required this.productID}) : super(key: key);
  final int productID;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  late bool isFavourite;
  late IconData favIcon;

  String imgPath = "assets/images/product.jpg";
  bool imgExist = false;
  late ProductDetailsBloc productDetailsBloc;
  List imagesList = [];
  void initState() {
    productDetailsBloc = ProductDetailsBloc(
      initialState: BlocState(),
      id: widget.productID,
    );
    productDetailsBloc.add(ProductDetailsGetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductDetailsBloc, BlocState<DetailsProduct>>(
          bloc: productDetailsBloc,
          builder: (context, state) {
            if (state.hasError) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/error-cloud.gif',width: MediaQuery.of(context).size.width * 0.5,),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: const Text("Something went wrong")),
                        TextButton(
                          child:const Text('Try again'),
                          onPressed: (){
                            productDetailsBloc.add(ProductDetailsGetDataEvent());
                          },
                        )
                      ],
                    )),
              );
            }
            else if (state.hasData) {
              DetailsProduct product = state.data!;
              DateTime productDateTime = DateTime.parse(product.postDateTime!);
              String productDate =
                  "${productDateTime.day} - ${productDateTime.month} - ${productDateTime.year}";
              favIcon = state.isFav == true ? FontAwesomeIcons.solidHeart:FontAwesomeIcons.heart;
              if (product.productImages == null ||
                  product.productImages?.isEmpty == true) {
                imgPath = "assets/images/product.png";
              } else {
                imgExist = true;
                imgPath = 'http://10.0.2.2:5228/Images/' +
                    product.productId.toString() +
                    '/';
                // imgPath = 'http://localhost:5228/Images/' +
                //     product.productId.toString() +
                //     '/';
                for (int i = 0; i < product.productImages!.length; i++) {
                  imagesList.add(imgPath + product.productImages![i]);
                }
              }
              return Stack(children: [
                  CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: Colors.black,
                        flexibleSpace: ListView.builder(
                          itemCount: imgExist ? imagesList.length : 1,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext build, int index) {
                            if (imgExist) {
                              return Image.network(
                                imagesList[index],
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              );
                            } else {
                              return Image.asset(
                                imgPath,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              );
                            }
                          },
                        ),
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            FontAwesomeIcons.angleLeft,
                            color: Colors.blueGrey,
                            size: 30,
                          ),
                        ),
                        actions: [
                          Container(
                            margin: const EdgeInsets.only(right: 16, top: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              color: Colors.white.withOpacity(0.3),
                            ),
                            child: IconButton(
                              onPressed: () {
                                productDetailsBloc.add(AddProductToFavEvent());
                              },
                              icon: Icon(
                                favIcon,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                        centerTitle: true,
                        title: const Text(
                          'Details',
                          style: TextStyle(fontSize: 24),
                        ),
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(70),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                            ),
                            child: Text(
                              product.title!,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        expandedHeight: MediaQuery.of(context).size.height * 0.6,
                        floating: true,
                        pinned: true,
                        snap: true,
                        toolbarHeight: 60,
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 2,
                                children: [
                                  Chip(
                                    label: Text(
                                      product.ownerFullName!,
                                    ),
                                    avatar: const Icon(
                                      FontAwesomeIcons.solidCircleUser,
                                      size: 20,
                                    ),
                                    backgroundColor: Colors.grey[300],
                                  ),
                                  Chip(
                                    label: Text(
                                      product.subcategory!,
                                    ),
                                    backgroundColor: Colors.grey[300],
                                  ),
                                  Chip(
                                    label: Text(
                                      product.status!.toString(),
                                    ),
                                    backgroundColor: Colors.grey[300],
                                  ),
                                  Chip(
                                    label: Text(
                                      product.viewsCount!.toString(),
                                    ),
                                    avatar: const Icon(
                                      FontAwesomeIcons.solidEye,
                                      size: 20,
                                    ),
                                    backgroundColor: Colors.grey[300],
                                  ),
                                  Chip(
                                    label: Text(
                                      productDate,
                                    ),
                                    avatar: const Icon(
                                      FontAwesomeIcons.solidClock,
                                      size: 20,
                                    ),
                                    backgroundColor: Colors.grey[300],
                                  ),
                                  Chip(
                                    label: Text(
                                      "${product.area},${product.city}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    avatar: const Icon(
                                      FontAwesomeIcons.locationDot,
                                      size: 20,
                                    ),
                                    backgroundColor: Colors.grey[300],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Description',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                product.descrioption!,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Card(
                                elevation: 10,
                                child: Container(
                                  color: Colors.yellow[200],
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.warning),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Instructions",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(Icons.warning),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                            product.instructions!.length,
                                            (index) {
                                          return Column(children: [
                                            Text(
                                              "- ${product.instructions![index]}",
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ]);
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 80,
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.black26,
                          width: 1,
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Price',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "${product.price!.toString()} EGP",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueGrey,
                                ),
                                child: const Text(
                                  'Call the Seller',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                print(product.ownerPhoneNumber);
                                callOwener(product.ownerPhoneNumber);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]
                  );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  void callOwener(String? ownerPhoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: ownerPhoneNumber,
    );
    await launchUrl(launchUri);
  }
}
