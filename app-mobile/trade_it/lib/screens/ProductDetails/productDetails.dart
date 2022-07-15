import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);
  List list = [
    "assets/images/product.jpg",
    "assets/images/product.jpg",
    "assets/images/product.jpg",
    "assets/images/product.jpg",
    "assets/images/product.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
            children:[
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    flexibleSpace: ListView.builder(
                      itemCount: list.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext build,int index){
                        return Image.asset(list[index],width: size.width,fit: BoxFit.cover,);
                      },
                    ),
                    leading: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon:const Icon(
                        FontAwesomeIcons.angleLeft,
                        color: Colors.blueGrey,
                        size: 30,
                      ),
                    ),
                    actions: [
                      Container(
                        margin: EdgeInsets.only(right: 16,top: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34),
                          color: Colors.white.withOpacity(0.3),

                        ),
                        child: IconButton(
                          onPressed: (){

                          },
                          icon:const Icon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ],
                    centerTitle: true,
                    title: const Text('Details',
                      style: TextStyle(
                          fontSize: 24
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(70),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                        ),
                        child: const Text('D750 Nikon',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),

                      ),
                    ),
                    expandedHeight: MediaQuery.of(context).size.height * 0.6,
                    floating: true,
                    pinned: true,
                    snap: true,
                    toolbarHeight: 60,
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 8,
                            children: [
                              Chip(
                                label: const Text(
                                  'Khalid Waleed',
                                ),

                                avatar: const Icon(
                                  FontAwesomeIcons.solidCircleUser,
                                  size: 20,
                                ),
                                backgroundColor: Colors.grey[200],
                              ),
                              Chip(
                                label: const Text(
                                  '20:30 PM',
                                ),
                                avatar: const Icon(
                                  FontAwesomeIcons.solidClock,
                                  size: 20,
                                ),
                                backgroundColor: Colors.grey[200],
                              ),
                              Chip(
                                label: const Text(
                                  'Zagazig',
                                ),
                                avatar: const Icon(
                                  FontAwesomeIcons.locationDot,
                                  size: 20,
                                ),
                                backgroundColor: Colors.grey[200],
                              ),
                              Chip(
                                label: const Text(
                                  '20 views',
                                ),
                                avatar: const Icon(
                                  FontAwesomeIcons.solidEye,
                                  size: 20,
                                ),
                                backgroundColor: Colors.grey[200],
                              ),
                              Chip(
                                label: const Text(
                                  'Cameras',
                                ),
                                backgroundColor: Colors.grey[200],
                              ),
                            ],
                          ),
                          const Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Text("The D750 has a feature set unlike full-frame DSLRs its size. It uses the same autofocus and metering technology as the D4S and the D810—Nikon's powerful 51-point AF system with 15 cross-type sensors and 3D Color Matrix Metering III with a 91,000-pixel RGB sensor. It's fast and responsive; shoot 6.5 fps at full resolution. And it's endlessly versatile; shoot stills in multiple formats, video with enhanced definition, smooth time-lapse sequences up to 9,999 shots in-camera and more—all with stunning sharpness and rich tonality. Open new compositional possibilities with its 3.2-inch 1,229k dot tilting Vari-angle LCD display, or use a compatible smartphone or tablet as a remote monitor for Live View shooting."),
                          const Text(
                            'Status : New',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Text("Request Count: 2",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 80,
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "15.00 EGP",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 40,vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey,
                          ),
                          child: const Text(
                            'Call the Seller',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: (){

                        },
                      )
                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
