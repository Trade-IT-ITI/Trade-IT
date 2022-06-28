import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trade_it/layout/product.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> imageList = [
    "assets/images/banner.jpg",
    "assets/images/banner.jpg",
    "assets/images/banner.jpg",
    "assets/images/banner.jpg",
    "assets/images/banner.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    int gridCount =  MediaQuery.of(context).size.width > 500 ? 3 : 2;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
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
            Container(
              width: MediaQuery.of(context).size.width * .9,
              child:  TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2.0),
                  ),
                  hintText: 'Search',


                  prefixIcon:const Icon(Icons.search),
                  suffixIcon:const Icon(Icons.sort),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridCount,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1/1.5,
                  ),
                  itemCount: 16,
                  itemBuilder: (BuildContext context, int index) {
                    return const Product();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
