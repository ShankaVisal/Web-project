import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:untitled3/screens/menu/components/Burger%20&%20Sandwich.dart';
import 'package:untitled3/screens/menu/components/Cuisines.dart';
import 'package:untitled3/screens/menu/components/Drinks.dart';
import 'package:untitled3/screens/menu/components/Pizza.dart';
import 'package:untitled3/screens/menu/components/Short%20Eats.dart';


class tabs extends StatefulWidget {
  const tabs({Key? key}) : super(key: key);

  @override
  State<tabs> createState() => _tabsState();
}

class _tabsState extends State<tabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int size_short_eats = 0;
  int size_drinks = 0;
  int size_burgers = 0;
  int size_pizza = 0;
  int size_cuisines = 0;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    shortEatsDocID();
    pizzaDocID();
    cuisinesDocID();
    burgersDocID();
    drinksDocID();
  }

  Future<void> shortEatsDocID() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('short eats').get();
    print(snapshot.size);

    setState(() {
      size_short_eats = snapshot.size;
    });
  }
  Future<void> drinksDocID() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFirestore.instance.collection('drinks').get();
    print(snapshot.size);

    setState(() {
      size_drinks = snapshot.size;
    });
  }
  Future<void> pizzaDocID() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFirestore.instance.collection('pizza').get();
    print(snapshot.size);

    setState(() {
      size_pizza = snapshot.size;
    });
  }
  Future<void> cuisinesDocID() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFirestore.instance.collection('cuisines').get();
    print(snapshot.size);

    setState(() {
      size_cuisines = snapshot.size;
    });
  }
  Future<void> burgersDocID() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFirestore.instance.collection('burgers').get();
    print(snapshot.size);

    setState(() {
      size_burgers = snapshot.size;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height,
      child: Column(
        children: [
          TabBar(controller: _tabController, tabs: [
            Tab(
              text: "Short Eats",
            ),
            Tab(
              text: 'Cuisines',
            ),
            Tab(
              text: 'Pizza',
            ),
            Tab(
              text: 'Burger & Sandwich',
            ),
            Tab(
              text: 'Drinks',
            ),
          ]),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = 4;
                    double screenWidth = constraints.maxWidth;

                    if (screenWidth < 700) {
                      crossAxisCount = 1;
                    } else if (screenWidth < 1000) {
                      crossAxisCount = 2;
                    } else if (screenWidth < 1300) {
                      crossAxisCount = 3;
                    } else {
                      crossAxisCount = 4;
                    }

                    return SingleChildScrollView(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                        ),
                        itemCount: size_short_eats.toInt(), // Set your itemCount as needed
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final docId = (index + 1).toString();
                          return shortEatFoods(docid: docId);

                        },
                      ),
                    );
                  },
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = 4;
                    double screenWidth = constraints.maxWidth;

                    if (screenWidth < 700) {
                      crossAxisCount = 1;
                    } else if (screenWidth < 1000) {
                      crossAxisCount = 2;
                    } else if (screenWidth < 1300) {
                      crossAxisCount = 3;
                    } else {
                      crossAxisCount = 4;
                    }

                    return SingleChildScrollView(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                        ),
                        itemCount: size_cuisines.toInt(), // Set your itemCount as needed
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final docId = (index + 1).toString();
                          return cuisinesFoods(docid: docId);
                        },
                      ),
                    );
                  },
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = 4;
                    double screenWidth = constraints.maxWidth;

                    if (screenWidth < 700) {
                      crossAxisCount = 1;
                    } else if (screenWidth < 1000) {
                      crossAxisCount = 2;
                    } else if (screenWidth < 1300) {
                      crossAxisCount = 3;
                    } else {
                      crossAxisCount = 4;
                    }

                    return SingleChildScrollView(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                        ),
                        itemCount: size_pizza.toInt(), // Set your itemCount as needed
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final docId = (index + 1).toString();
                          return pizzaFoods(docid: docId);
                        },
                      ),
                    );
                  },
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = 4;
                    double screenWidth = constraints.maxWidth;

                    if (screenWidth < 700) {
                      crossAxisCount = 1;
                    } else if (screenWidth < 1000) {
                      crossAxisCount = 2;
                    } else if (screenWidth < 1300) {
                      crossAxisCount = 3;
                    } else {
                      crossAxisCount = 4;
                    }

                    return SingleChildScrollView(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                        ),
                        itemCount: size_burgers.toInt(), // Set your itemCount as needed
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final docId = (index + 1).toString();
                          return burgerSandwichFoods(docid: docId);
                        },
                      ),
                    );
                  },
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = 4;
                    double screenWidth = constraints.maxWidth;

                    if (screenWidth < 700) {
                      crossAxisCount = 1;
                    } else if (screenWidth < 1000) {
                      crossAxisCount = 2;
                    } else if (screenWidth < 1300) {
                      crossAxisCount = 3;
                    } else {
                      crossAxisCount = 4;
                    }

                    return SingleChildScrollView(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                        ),
                        itemCount: size_drinks.toInt(), // Set your itemCount as needed
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final docId = (index + 1).toString();
                          return drinkFoods(docid: docId);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
