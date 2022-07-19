import 'package:flutter/material.dart';

import '../models/filter.dart';
import 'constants.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final minPriceController = TextEditingController();
    final maxPriceController = TextEditingController();
    var screenWidth = MediaQuery.of(context).size.width;
    return Center(
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
    );
  }
}
