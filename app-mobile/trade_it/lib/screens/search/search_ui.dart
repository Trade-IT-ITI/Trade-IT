import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/models/product.dart';
import 'package:trade_it/screens/search/search_bloc.dart';

import '../../layout/product_card.dart';
import '../../models/filter.dart';

class Search extends StatefulWidget {
  Search({Key? key, required this.filterDataOBJ}) : super(key: key);
  final FilterData filterDataOBJ;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late SearchBloc searchBloc;
  void initState() {
    searchBloc = SearchBloc(
      initialState: BlocState(),
      filterOBJ: widget.filterDataOBJ,
    );
    searchBloc.add(SearchGetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SearchBloc, BlocState<List<Product>>>(
          bloc: searchBloc,
          builder: (context, state) {
            if (state.hasError) {
              return const Center(
                child: Text("There Was a Problem !"),
              );
            } else if (state.hasData) {
              // print("state.data");
              // print(state.data![0].price);
              var screenWidth = MediaQuery.of(context).size.width;
              int gridCount = screenWidth > 500 ? 3 : 2;
              //return Text("askjhdc");
              if (state.data!.isEmpty) {
                return SizedBox(
                  width: screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No Products",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      ElevatedButton(
                        child: const Text('Return To Home'),
                        onPressed: () => Navigator.pushNamed(context, "/home"),
                      ),
                    ],
                  ),
                );
              }
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/home");
                          },
                          icon: const Icon(
                            FontAwesomeIcons.angleLeft,
                            color: Colors.blueGrey,
                            size: 30,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          "Products",
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
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
                                itemCount: state.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  // print("data");
                                  // print(state.data![index]);
                                  return ProductCard(
                                    productOBJ: state.data![index],
                                  );
                                  //return Text(state.data![index].title ?? "NULL");
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
}
