import 'package:flutter/material.dart';
import 'package:untitled3/model.dart/product_model.dart';
import 'package:untitled3/screens/menu/components/productCards.dart';

class tabs extends StatefulWidget {
  const tabs({Key? key}) : super(key: key);

  @override
  State<tabs> createState() => _tabsState();
}

class _tabsState extends State<tabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
              text: "Tab 1",
            ),
            Tab(
              text: 'Tab 2',
            ),
            Tab(
              text: 'Tab 3',
            )
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

                    return GridView.count(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: products.map((product) => menuProducts(product: product)).toList(),
                    );
                  },
                ),
                Center(child: Text('Tab 002')),
                Center(child: Text('Tab 003')),
              ],
            ),
          )

        ],
      ),
    );
  }
}
