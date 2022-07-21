import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/screens/profile/profile_bloc.dart';

import '../../layout/profile_product.dart';
import '../../models/user.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  ProfileBloc profileBloc = ProfileBloc(BlocState());

  bool fav = false;

  @override
  Widget build(BuildContext context) {
    profileBloc.add(ProfileGetDataEvent());
    return BlocBuilder<ProfileBloc, BlocState<User>>(
      bloc: profileBloc,
      builder: (context, state) {
        if (state.hasError) {
          return const Center(
            child: Text("There Was a Problem !"),
          );
        } else if (state.hasData) {
          var screenWidth = MediaQuery.of(context).size.width;
          TabController _tabController = TabController(length: 2, vsync: this);
          return DefaultTabController(
            length: 2,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/avatar.png',
                                ),
                              ),
                              // backgroundColor: Colors.transparent,
                              // backgroundImage: AssetImage(
                              //   'assets/images/avatar.png',
                              // ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Marwan Sayed",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                              ),
                              Text(
                                'marwansayed@gmail.com',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                              ),
                              Text(
                                '01112236458',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    TabBar(
                      controller: _tabController,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 5.0,
                        ),
                        insets: EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 0.0),
                      ),
                      tabs: [
                        Container(
                          child: Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.redAccent,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Favorites",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.redAccent,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Your Ads",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.maxFinite,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.builder(
                              itemCount: 10,
                              itemBuilder: (_, i) {
                                return ProductProfileCard(
                                  imageUrl: 'assets/images/product.jpg',
                                  price: 120.99,
                                  productName: "product name",
                                  inStock: true,
                                );
                              }),
                          ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 5,
                              itemBuilder: (_, index) {
                                return ProductProfileCard(
                                  imageUrl: 'assets/images/product.jpg',
                                  price: 120.99,
                                  productName: "product name",
                                  inStock: true,
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // child: Scaffold(
              //   body: Column(
              //     children: [
              //       Container(
              //         padding: const EdgeInsets.all(20),
              //         height: MediaQuery.of(context).size.height * 0.4,
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Container(
              //               width: MediaQuery.of(context).size.width * 0.5,
              //               decoration: const BoxDecoration(
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(50)),
              //               ),
              //               child: CircleAvatar(
              //                 radius: 60,
              //                 child: ClipOval(
              //                   child: Image.asset(
              //                     'assets/images/avatar.png',
              //                   ),
              //                 ),
              //                 // backgroundColor: Colors.transparent,
              //                 // backgroundImage: AssetImage(
              //                 //   'assets/images/avatar.png',
              //                 // ),
              //               ),
              //             ),
              //             Column(
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               children: const [
              //                 Text("username"),
              //                 Text('Email'),
              //                 Text('phone')
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //       Container(
              //         height: 50,
              //         decoration: BoxDecoration(border: Border.all()),
              //         width: double.infinity,
              //         margin: const EdgeInsets.only(bottom: 10),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Expanded(
              //               flex: 1,
              //               child: GestureDetector(
              //                 child: const Center(child: Text("Fav")),
              //                 onTap: () {
              //                   setState(() => fav = true);
              //                 },
              //               ),
              //             ),
              //             Expanded(
              //               flex: 1,
              //               child: GestureDetector(
              //                 child: const Center(child: Text("Products")),
              //                 onTap: () {
              //                   setState(() => fav = false);
              //                 },
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Expanded(
              //           child: fav
              //               ? ListView.separated(
              //                   itemBuilder: (ctx, index) => ProductProfileCard(
              //                         imageUrl: 'assets/images/product.jpg',
              //                         price: 120.99,
              //                         productName: "product name",
              //                         inStock: true,
              //                       ),
              //                   separatorBuilder: (ctx, index) =>
              //                       const Divider(),
              //                   itemCount: 50)
              //               : ListView.separated(
              //                   itemBuilder: (ctx, index) =>
              //                       const Center(child: Text("pro")),
              //                   separatorBuilder: (ctx, index) =>
              //                       const Divider(),
              //                   itemCount: 50)),
              //     ],
              //   ),
              // ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
