import 'package:flutter/material.dart';
import 'package:trade_it/models/user.dart';

import 'onboardPage.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  List<Widget> pages = [
    const OnboardPage(
      title: "Do you Have Items You Don't Need ?",
      description:
          "With Trade it you can easily sell your items from home just share your items and wait for offers",
      img: "assets/images/2.png",
    ),
    const OnboardPage(
      title:
          "Do you get tired from searching for a specific item or second-hand item ?",
      description: "With Trade it you can easily find what you looking for",
      img: "assets/images/4.png",
    ),
    const OnboardPage(
      title: "What are you waiting for ?",
      description: "Deal with sellers and customers from all over the world ",
      img: "assets/images/1.png",
    ),
    const OnboardPage(
      title: "Do It",
      description: "And Finish all your commercial transactions using trade it",
      img: "assets/images/3.png",
    ),
  ];
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 50),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    controller: _pageController,
                    itemCount: pages.length,
                    itemBuilder: (context, index) => pages[index],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      ...List.generate(
                        pages.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: PageIndicator(
                            active: index == _pageIndex,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_pageIndex == pages.length - 1) {
            setFirstUse();
            Navigator.pushReplacementNamed(context, "/login");
          } else {
            _pageController.nextPage(
              duration: const Duration(seconds: 1),
              curve: Curves.decelerate,
            );
          }
        },
        child: const Icon(
          Icons.arrow_right_alt,
          size: 30,
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    Key? key,
    this.active = false,
  }) : super(key: key);
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: active ? 30 : 9,
      decoration: BoxDecoration(
        color: active ? Colors.blue : Colors.blueGrey,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
