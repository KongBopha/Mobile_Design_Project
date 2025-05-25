import 'package:flutter/material.dart';
import 'package:landing_page/customfeaturedcourse.dart';

class Featuredcourse extends StatefulWidget {
  const Featuredcourse({super.key});

  @override
  State<Featuredcourse> createState() => _FeaturedcourseState();
}

class _FeaturedcourseState extends State<Featuredcourse>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Rebuild on tab change to update dot indicator
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Featured Courses",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.orange,
            indicatorWeight: 3,
            tabs: const [
              Tab(text: 'Artificial Intelligence'),
              Tab(text: 'Machine Learning'),
              Tab(text: 'Self Development'),
            ],
          ),
          SizedBox(
            height: 550,
            child: TabBarView(
              controller: _tabController,
              children: const [
                CustomFeaturedCourse(),
                CustomFeaturedCourse(),
                CustomFeaturedCourse(),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Dot Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _tabController.index == index
                      ? Colors.orange
                      : Colors.grey.shade300,
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
