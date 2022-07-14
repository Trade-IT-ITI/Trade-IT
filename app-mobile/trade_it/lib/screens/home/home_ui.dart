import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/screens/home/home_bloc.dart';

import '../../layout/product.dart';
import '../../models/user.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  HomeBloc homeBloc = HomeBloc(BlocState());
  List<String> imageList = [
    "assets/images/banner.jpg",
    "assets/images/banner.jpg",
    "assets/images/banner.jpg",
    "assets/images/banner.jpg",
    "assets/images/banner.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    homeBloc.add(HomeGetDataEvent());
    int gridCount = MediaQuery.of(context).size.width > 500 ? 3 : 2;
    return BlocBuilder<HomeBloc, BlocState<List<User>>>(
      bloc: homeBloc,
      builder: (context, state) {
        if (state.hasError) {
          return const Center(
            child: Text("There Was a Problem !"),
          );
        } else if (state.hasData) {
          return SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Discover",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .8,
                        height: 55,
                        child: Card(
                          elevation: 2,
                          child: TextField(
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 231, 229, 229),
                                    width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 1.0),
                              ),
                              prefixIcon: const Icon(Icons.search),
                              labelText: "Search",
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.sliders),
                        color: Theme.of(context).colorScheme.secondary,
                        iconSize: 32,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: .95,
                            enlargeCenterPage: true,
                            height: 200,
                            enableInfiniteScroll: false,
                            autoPlay: true,
                          ),
                          items: imageList
                              .map((img) => ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: <Widget>[
                                        Image.asset(
                                          img,
                                          fit: BoxFit.cover,
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: gridCount,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 5,
                                childAspectRatio: 1 / 2.2,
                              ),
                              itemCount: state.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                print("data");
                                print(state.data![index].firstName ?? "NULL");
                                return const Product();
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
