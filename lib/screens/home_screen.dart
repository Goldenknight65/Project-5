import 'package:blog_app/data_layer/get_blog.dart';
import 'package:blog_app/helper/nav.dart';
import 'package:blog_app/screens/add_blog.dart';
import 'package:blog_app/screens/nav_tabs/explore_screen.dart';
import 'package:blog_app/screens/nav_tabs/fead_screen.dart';
import 'package:blog_app/screens/nav_tabs/profile_screen.dart';
import 'package:blog_app/screens/nav_tabs/saved_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          drawer: const Drawer(),
          appBar: currentPageIndex == 0
              ? AppBar(
                  actions: [
                    GetIt.I.get<GetBlog>().currentUser.userName.isNotEmpty
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                onPressed: () {
                                  context.navToUpdate(const AddBlog(), () {
                                    setState(() {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen()));
                                    });
                                  });
                                },
                                icon: const Icon(Icons.add)),
                          )
                        : const SizedBox()
                  ],
                  backgroundColor: const Color(0xff1e1e1e),
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        child: Text("Tech"),
                      ),
                      Tab(
                        child: Text("AI"),
                      ),
                      Tab(
                        child: Text("Cloud"),
                      ),
                      Tab(
                        child: Text("Robot"),
                      ),
                      Tab(
                        child: Text("Iot"),
                      ),
                    ],
                    labelColor: Colors.white,
                    indicatorColor: Colors.red,
                  ),
                )
              : null,
          bottomNavigationBar: NavigationBar(
            selectedIndex: currentPageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.list_alt),
                label: 'Feed',
              ),
              NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                label: 'Explore',
              ),
              NavigationDestination(
                icon: Icon(Icons.bookmark_border),
                label: 'Saved',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outlined),
                label: 'Profile',
              ),
            ],
          ),
          body: [
            const FeadScreen(),
            const ExploreScreen(),
            const SavedScreen(),
            const ProfileScreen()
          ][currentPageIndex],
        ));
  }
}
