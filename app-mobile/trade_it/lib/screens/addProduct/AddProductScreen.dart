import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trade_it/layout/kDropdownList.dart';
import 'package:trade_it/models/product.dart';
import 'package:trade_it/models/sub_category.dart';
import 'package:trade_it/screens/addProduct/cubit/productCubit.dart';
import 'package:trade_it/screens/addProduct/cubit/productStates.dart';


class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  var productNameTextController = TextEditingController();
  var productPriceTextController = TextEditingController();
  var productDescriptionTextController = TextEditingController();
  File? image;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AddProductCubit>(context).getCategories();
  }

  void addProductImage(ImageSource imageSource)async{
    try{
      var image = await ImagePicker().pickImage(source: imageSource);
      if(image == null){
        return null;
      }
      final pickedImageFile = File(image.path);
      setState(() {
        this.image = pickedImageFile;
      });

    } on PlatformException catch(error){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.white,
          elevation: 10,
          duration: const Duration(seconds: 2),
          content: Text(
            error.message!,
            textAlign: TextAlign.right,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Colors.black),
          ),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<AddProductCubit, AddProductState>(
              builder: (context, state) {
            if (state is AddProductLoading) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.98,
                child: Center(
                  child: Container(
                    child: const Text('Laoding'),
                  ),
                ),
              );
            } else if (state is RequiredDataFailed) {
              return Center(child: Container(child: const Text("FFF")));
            } else if(state is AddProductFailed){
              return Center(child: Container(child: Text(state.error.toString())));
            }
            else {
              state as RequiredDataLoaded;
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Container(
                       decoration: BoxDecoration(
                         color: Colors.grey[100],
                         borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(18),bottomRight: Radius.circular(18))
                       ),
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: const Center(
                        child: Text(
                            "Add Product",
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: "Poppins",

                            ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: InkWell(
                        child: image == null?
                                 Image.asset('assets/images/imagePlaceholder.png'):
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.file(image!, fit: BoxFit.cover,),
                                  ),
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            elevation: 3,
                            builder: (context)=>Container(
                              color: const Color(0xFF757575),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.2,
                                padding: const EdgeInsets.only(right: 20,left: 20,top: 10),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.08,
                                      child: TextButton(
                                        child: Row(
                                          children: const [
                                            Icon(
                                              FontAwesomeIcons.camera,
                                              color: Colors.blueGrey,
                                              size: 30,
                                            ),
                                            SizedBox(width: 16,),
                                            Text(
                                              'Take a photo',
                                              style: TextStyle(color: Colors.black),
                                            )
                                          ],
                                        ),
                                        onPressed: (){
                                          addProductImage(ImageSource.camera);
                                        },
                                      ),
                                    ),
                                    Divider(color: Colors.grey[300],),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.08,
                                      child: TextButton(
                                        child: Row(
                                          children: const [
                                            Icon(
                                              FontAwesomeIcons.solidImages,
                                              color: Colors.blueGrey,
                                              size: 30,
                                            ),
                                            SizedBox(width: 16,),
                                            Text(
                                              'Pick an image from Gallery',
                                              style: TextStyle(color: Colors.black),
                                            )
                                          ],
                                        ),
                                        onPressed: (){
                                          addProductImage(ImageSource.gallery);
                                        },
                                      ),
                                    )
                                  ],
                                ),

                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: productNameTextController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Product Name',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          border: OutlineInputBorder(
                            // on error only
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: productPriceTextController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a valid price';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Product Price in EGP',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          border: OutlineInputBorder(
                            // on error only
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: productDescriptionTextController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                        },
                        maxLines: 6,
                        decoration: InputDecoration(
                          labelText: 'Product Description',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          border: OutlineInputBorder(
                            // on error only
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    KDropdownList(
                      label: 'Select Category',
                      items: List.generate(state.categories.length, (index) {
                        return DropdownMenuItem(
                          child: Text(state.categories[index].name),
                          value: state.categories[index],
                        );
                      }),
                      value: BlocProvider.of<AddProductCubit>(context)
                          .selectedCategory,
                      onChanged: (category) {
                        setState(() {
                          BlocProvider.of<AddProductCubit>(context)
                              .selectedCategory = category!;

                          BlocProvider.of<AddProductCubit>(context)
                              .selectedSubCategory = category.subcategories[0];
                        });
                      },
                    ),
                    KDropdownList(label: 'Select SubCategory',
                        items: List.generate(BlocProvider.of<AddProductCubit>(context).selectedCategory.subcategories.length, (index) {
                          return DropdownMenuItem(
                            child: Text(BlocProvider.of<AddProductCubit>(context).selectedCategory.subcategories[index].name!),
                            value: BlocProvider.of<AddProductCubit>(context).selectedCategory.subcategories[index],
                          );
                        }),
                        onChanged: (subCategory) {
                          setState(() {
                            BlocProvider.of<AddProductCubit>(context)
                                .selectedSubCategory = subCategory!;

                          });
                        },
                        value: BlocProvider.of<AddProductCubit>(context)
                            .selectedSubCategory),
                    KDropdownList(
                        label: "Select City",
                        items: List.generate(state.cities.length, (index) {
                          return DropdownMenuItem(
                            child: Text(state.cities[index].name),
                            value: state.cities[index],
                          );
                        }),
                        onChanged: (city) {
                          setState(() {
                            BlocProvider.of<AddProductCubit>(context)
                                .selectedCity = city!;

                            BlocProvider.of<AddProductCubit>(context)
                                .selectedArea = city.areas[0];
                          });
                        },
                        value: BlocProvider.of<AddProductCubit>(context)
                            .selectedCity),
                    KDropdownList(label: "Select Area",
                        items: List.generate(BlocProvider.of<AddProductCubit>(context).selectedCity.areas.length , (index) {
                          return DropdownMenuItem(
                            child: Text(BlocProvider.of<AddProductCubit>(context).selectedCity.areas[index].name),
                            value: BlocProvider.of<AddProductCubit>(context).selectedCity.areas[index],
                          );
                        }),
                        onChanged: (area) {
                          setState(() {
                            BlocProvider.of<AddProductCubit>(context)
                                .selectedArea = area!;
                          });
                        },
                        value: BlocProvider.of<AddProductCubit>(context)
                            .selectedArea),
                    TextButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blueGrey
                        ),
                        child: const Text(
                          'Add a new Product',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      onPressed: (){
                        final isValid = _formKey.currentState?.validate();

                        if(isValid == true && image != null){
                          Product product=  Product(
                            title: productNameTextController.text,
                            descrioption: productDescriptionTextController.text,
                            price: num.parse(productPriceTextController.text).toDouble(),
                            cityId: BlocProvider.of<AddProductCubit>(context).selectedCity.id,
                            areaId: BlocProvider.of<AddProductCubit>(context).selectedArea.id,
                            subcategoryId: BlocProvider.of<AddProductCubit>(context).selectedSubCategory.subcategoryId,
                            productImages: [image?.path],
                            userId: 12,
                          );
                          BlocProvider.of<AddProductCubit>(context).addProduct(product);
                        }


                      },
                    ),
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}

