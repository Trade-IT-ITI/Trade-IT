import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/models/filter.dart';
import 'package:trade_it/screens/home/home_bloc.dart';

import '../../layout/constants.dart';
import '../../layout/filter_widget.dart';
import '../../layout/product_card.dart';
import '../../models/product.dart';
import '../../models/user.dart';
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
    printUserName();
    homeBloc.add(HomeGetDataEvent());
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: SizedBox(
        width: screenWidth * .85,
        child: const Drawer(
          child: FilterWidget(),
        ),
      ),
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Image.asset('assets/images/logo2-1.png',width: 50,height: 50,),
                const Text(
                  "Discover",
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
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
            BlocBuilder<HomeBloc, BlocState<List<List>>>(
              bloc: homeBloc,
              builder: (context, state) {
                if (state.hasError) {
                  return Expanded(
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("There Was a Problem !"),
                        TextButton(
                          child: const Text("Try again"),
                          onPressed: (){
                            homeBloc.add(HomeGetDataEvent());
                          },
                        ),
                      ],
                    ),
                  );
                } else if (state.hasData) {
                  int gridCount = screenWidth > 500 ? 3 : 2;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.71,
                    child: SingleChildScrollView(
                      child: Column(
                        children:[
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
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.6,
                                  ),
                                  itemCount: state.data![0].length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ProductCard(
                                      productOBJ: state.data![0][index],
                                    );
                                    //return Text(state.data![index].title ?? "NULL");
                                  }),
                            ),
                          ]
                      ),
                    ),
                  );
                } else {
                  return  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

//For Testing
  void printUserName() async {
    User userr = await getUser();
    print("User In Home");
    //List<Product> p = toProductList(objProductList: userr.products!);
    print(userr.products);
  }
}
