import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_it/layout/kDropdownList.dart';
import 'package:trade_it/models/area.dart';
import 'package:trade_it/models/category.dart';
import 'package:trade_it/models/city.dart';
import 'package:trade_it/models/sub_category.dart';
import 'package:trade_it/screens/addProduct/cubit/productCubit.dart';
import 'package:trade_it/screens/addProduct/cubit/productStates.dart';

import '../models/filter.dart';
import 'constants.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FilterWidgetState();
}

class FilterWidgetState extends State<FilterWidget> {
  late List<Category> categories;
  late List<City> cities;

  Category? selectedCategory;
  SubCategory? selectedSubCategory;

  City? selectedCity;
  Area? selectedArea;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AddProductCubit>(context).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        if (state is AddProductLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.98,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.blueGrey,
              ),
            ),
          );
        } else if (state is RequiredDataFailed) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.98,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/error-cloud.gif',
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(state.error.toString())),
              ],
            )),
          );
        } else {
          state as RequiredDataLoaded;
          categories = state.categories;
          cities = state.cities;
          return Center(
            child: SingleChildScrollView(
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
                              child: TextFormField(
                                controller: minPriceController,
                                keyboardType: TextInputType.number,
                                decoration: inputStyle(
                                  context: context,
                                  hintText: "Min Price",
                                ),
                              ),
                              width: screenWidth * .4,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: maxPriceController,
                                keyboardType: TextInputType.number,
                                decoration: inputStyle(
                                  context: context,
                                  hintText: "Max Price",
                                ),
                              ),
                              width: screenWidth * .38,
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        ),
                        KDropdownList(
                          label: 'Select Category',
                          items: List.generate(categories.length, (index) {
                            return DropdownMenuItem(
                              child: Text(categories[index].name),
                              value: categories[index],
                            );
                          }),
                          value: selectedCategory,
                          onChanged: (category) {
                            setState(() {
                              selectedCategory = category;

                              selectedSubCategory = category.subcategories[0];
                            });
                          },
                        ),
                        KDropdownList(
                          label: 'Select SubCategory',
                          items: List.generate(
                              selectedCategory?.subcategories.length ?? 0,
                              (index) {
                            return DropdownMenuItem(
                              child: Text(
                                  selectedCategory?.subcategories[index].name ??
                                      ""),
                              value:
                                  selectedCategory?.subcategories[index] ?? -1,
                            );
                          }),
                          onChanged: (subCategory) {
                            setState(() {
                              selectedSubCategory = subCategory;
                            });
                          },
                          value: selectedSubCategory,
                        ),
                        KDropdownList(
                          label: "Select City",
                          items: List.generate(cities.length, (index) {
                            return DropdownMenuItem(
                              child: Text(cities[index].name),
                              value: cities[index],
                            );
                          }),
                          onChanged: (city) {
                            setState(() {
                              selectedCity = city;
                              selectedArea = city.areas[0];
                            });
                          },
                          value: selectedCity,
                        ),
                        KDropdownList(
                            label: "Select Area",
                            items: List.generate(
                                selectedCity?.areas.length ?? 0, (index) {
                              return DropdownMenuItem(
                                child:
                                    Text(selectedCity?.areas[index].name ?? ""),
                                value: selectedCity?.areas[index] ?? -1,
                              );
                            }),
                            onChanged: (area) {
                              setState(() {
                                selectedArea = area;
                              });
                            },
                            value: selectedArea),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            int minPriceInput = minPriceController.text == ""
                                ? -1
                                : int.parse(minPriceController.text);
                            int maxPriceInput = maxPriceController.text == ""
                                ? -1
                                : int.parse(maxPriceController.text);
                            FilterData filterOBJ = FilterData(
                              maxPrice: maxPriceInput,
                              minPrice: minPriceInput,
                              city: selectedCity?.id ?? -1,
                              area: selectedArea?.id ?? -1,
                              category: selectedCategory?.id ?? -1,
                              subcategory:
                                  selectedSubCategory?.subcategoryId ?? -1,
                            );
                            filterPage(context, filterOBJ);
                            print(minPriceInput);
                            print(maxPriceInput);
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('Filter'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
