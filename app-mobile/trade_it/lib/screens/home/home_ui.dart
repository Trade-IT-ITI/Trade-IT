import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/models/filter.dart';
import 'package:trade_it/screens/home/home_bloc.dart';

import '../../layout/product_card.dart';
import '../register/RegistrationPage.dart';
import '../search/search_ui.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  HomeBloc homeBloc = HomeBloc(BlocState());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _searchFormKey = GlobalKey<FormState>();
  final searchController = TextEditingController();
  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();
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
                child: Drawer(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    child: Field(
                                      type: TextInputType.number,
                                      controllerName: minPriceController,
                                      hint: "Min Price",
                                    ),
                                    width: screenWidth * .38,
                                  ),
                                  SizedBox(
                                    child: Field(
                                      type: TextInputType.number,
                                      controllerName: maxPriceController,
                                      hint: "Max Price",
                                    ),
                                    width: screenWidth * .4,
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                              ),
                              // Row(
                              //   children: [
                              //     SizedBox(
                              //       child: DropdownButton(
                              //         onChanged: (value) {},
                              //         items: const [
                              //           DropdownMenuItem<int>(
                              //             child: Text("1"),
                              //             value: 1,
                              //           ),
                              //           DropdownMenuItem<int>(
                              //             child: Text("1"),
                              //             value: 1,
                              //           ),
                              //           DropdownMenuItem<int>(
                              //             child: Text("1"),
                              //             value: 1,
                              //           ),
                              //           DropdownMenuItem<int>(
                              //             child: Text("1"),
                              //             value: 1,
                              //           ),
                              //         ],
                              //       ),
                              //       width: screenWidth * .38,
                              //     ),
                              //     SizedBox(
                              //       child: Field(
                              //         type: TextInputType.number,
                              //         controllerName: maxPriceController,
                              //         hint: "Max Price",
                              //       ),
                              //       width: screenWidth * .4,
                              //     ),
                              //   ],
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceAround,
                              // ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: ElevatedButton(
                            child: const Text('Cancel'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        )
                      ],
                    ),
                  ),
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
                              decoration: InputDecoration(
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      width: 1.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      width: 1.0),
                                ),
                                labelText: "Search",
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Search(
                                      filterDataOBJ: filterOBJ,
                                    ),
                                  ),
                                );
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

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({
    Key? key,
    required this.screenWidth,
    required this.formKey,
    required this.minPriceController,
  }) : super(key: key);
  final screenWidth;
  final formKey;
  final minPriceController;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      child: Field(
                        type: TextInputType.number,
                        controllerName: minPriceController,
                        hint: "Min Price",
                      ),
                      width: screenWidth * .38,
                    ),
                    SizedBox(
                      child: Field(
                        type: TextInputType.number,
                        controllerName: minPriceController,
                        hint: "Max Price",
                      ),
                      width: screenWidth * .4,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
          )
        ],
      ),
    );
  }
}
