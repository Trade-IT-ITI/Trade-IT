import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/models/filter.dart';
import 'package:trade_it/screens/home/home_bloc.dart';

import '../../layout/constants.dart';
import '../../layout/filter_widget.dart';
import '../../layout/product_card.dart';
import '../register/RegistrationPage.dart';
import '../search/search_ui.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  HomeBloc homeBloc = HomeBloc(BlocState());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _searchFormKey = GlobalKey<FormState>();
  final searchController = TextEditingController();

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
    return BlocBuilder<HomeBloc, BlocState<List<List>>>(
      bloc: homeBloc,
      builder: (context, state) {
        if (state.hasError) {
          return const Center(
            child: Text("There Was a Problem !"),
          );
        } else if (state.hasData) {
          var screenWidth = MediaQuery.of(context).size.width;
          int gridCount = screenWidth > 500 ? 3 : 2;
          return SafeArea(
            child: Scaffold(
              drawer: SizedBox(
                width: screenWidth * .85,
                child: const Drawer(
                  child: FilterWidget(),
                ),
              ),
              key: _scaffoldKey,
              body: Column(
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
                    child: Form(
                      key: _searchFormKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: screenWidth * .8,
                            height: 50,
                            child: TextFormField(
                              controller: searchController,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 3) {
                                  return "Enter a Word More than 3 Characters !";
                                }
                              },
                              decoration: inputStyle(
                                context: context,
                                hintText: "Search",
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (_searchFormKey.currentState!.validate()) {
                                print(searchController.text);
                                FilterData filterOBJ = FilterData(
                                  isSearch: true,
                                  searchText: searchController.text,
                                );
                                filterPage(context, filterOBJ);
                              }
                            },
                            icon:
                                const FaIcon(FontAwesomeIcons.magnifyingGlass),
                            color: Theme.of(context).colorScheme.secondary,
                            iconSize: 32,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // CarouselSlider(
                          //   options: CarouselOptions(
                          //     viewportFraction: .95,
                          //     enlargeCenterPage: true,
                          //     height: 200,
                          //     enableInfiniteScroll: false,
                          //     autoPlay: true,
                          //   ),
                          //   items: imageList
                          //       .map((img) => ClipRRect(
                          //             borderRadius: BorderRadius.circular(12),
                          //             child: Stack(
                          //               fit: StackFit.expand,
                          //               children: <Widget>[
                          //                 Image.asset(
                          //                   img,
                          //                   fit: BoxFit.cover,
                          //                 )
                          //               ],
                          //             ),
                          //           ))
                          //       .toList(),
                          // ),
                          Container(
                            height: 60,
                            margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            width: double.infinity,
                            child: ListView.builder(
                                itemCount: state.data![1].length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        FilterData filterOBJ = FilterData(
                                            subcategory: state
                                                .data![1][index].subcategoryId);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Search(
                                              filterDataOBJ: filterOBJ,
                                            ),
                                          ),
                                        );
                                        print(state
                                            .data![1][index].subcategoryId);
                                      },
                                      child: Chip(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 10,
                                        ),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        label: Text(
                                          state.data![1][index].name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Featured Products",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    _scaffoldKey.currentState!.openDrawer();
                                  },
                                  icon: const FaIcon(FontAwesomeIcons.sliders),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  iconSize: 28,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: gridCount,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 5,
                                  childAspectRatio: 1 / 2,
                                ),
                                itemCount: state.data![0].length,
                                itemBuilder: (BuildContext context, int index) {
                                  //print("data");
                                  //print(state.data![0][index] ?? "NULL");
                                  return ProductCard(
                                    productOBJ: state.data![0][index],
                                  );
                                  //return Text(state.data![index].title ?? "NULL");
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
