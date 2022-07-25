import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/models/user.dart';
import 'package:trade_it/screens/profile/profile_bloc.dart';

import '../../layout/profile_product.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  ProfileBloc profileBloc = ProfileBloc(BlocState());

  bool fav = false;

  @override
  Widget build(BuildContext context) {
    profileBloc.add(ProfileGetDataEvent());
    return BlocBuilder<ProfileBloc, BlocState<Map<String, dynamic>>>(
      bloc: profileBloc,
      builder: (context, state) {
        if (state.hasError) {
          return const Center(
            child: Text("There Was a Problem !"),
          );
        } else if (state.hasData) {
          var screenWidth = MediaQuery.of(context).size.width;
          TabController _tabController = TabController(length: 2, vsync: this);
          return DefaultTabController(
            length: 2,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(
                                flex: 2,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                child: CircleAvatar(
                                  radius: 50,
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/avatar.png',
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              IconButton(
                                onPressed: () {
                                  removeUser();
                                  Navigator.pushReplacementNamed(
                                      context, "/login");
                                },
                                icon: const Icon(
                                  Icons.logout,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                state.data!['loggedUser'].firstName +
                                    " " +
                                    state.data!['loggedUser'].lastName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                              ),
                              Text(
                                state.data!['loggedUser'].email,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                              ),
                              Text(
                                state.data!['loggedUser'].phone,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    TabBar(
                        controller: _tabController,
                        indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 5.0,
                          ),
                          insets: EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 0.0),
                        ),
                        tabs: [
                          Tab(
                            child: Text(
                              "Favorites",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Your Products",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: double.maxFinite,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.builder(
                              itemCount: state.data!["userFavProducts"].length,
                              itemBuilder: (_, i) {
                                return ProductProfileCard(
                                  productOBJ: state.data!["userFavProducts"][i],
                                );
                              }),
                          ListView.builder(
                              itemCount: state.data!["userProducts"].length,
                              itemBuilder: (_, i) {
                                return ProductProfileCard(
                                  productOBJ: state.data!["userProducts"][i],
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
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
