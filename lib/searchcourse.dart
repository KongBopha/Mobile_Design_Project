import 'package:flutter/material.dart';
import 'package:landing_page/custombottombar.dart';
import 'package:landing_page/customfeaturedcourse.dart';
import 'package:landing_page/footer.dart';

// Course data model
class Course {
  final String title;
  final String imageAsset;
  final String description;
  final String label;

  Course({
    required this.title,
    required this.imageAsset,
    required this.description,
    required this.label,
  });
}

class Searchcourse extends StatelessWidget {
  Searchcourse({super.key});

  final List<Course> courses = [
    Course(
      title: 'Introduction to Machine Learning',
      imageAsset: 'assets/image.png',
      description:
          'Machine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate.',
      label: 'Explore your favorite subjects!',
    ),
    Course(
      title: 'Introduction to Machine Learning',
      imageAsset: 'assets/image.png',
      description:
          'achine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate.',
      label: 'Build your competency with us!',
    ),
    Course(
      title: 'Introduction to Machine Learning',
      imageAsset: 'assets/image.png',
      description:
          'achine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate',
      label: 'Best recommended for you!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300, width: 2),
            ),
            leadingWidth: 130,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Image.asset('assets/logoname.png', fit: BoxFit.contain),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                color: Colors.blue.shade800,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Searchcourse()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.person),
                color: Colors.blue.shade800,
                onPressed: () {},
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      Navigator.pop(context); // Return to previous 
                    },
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                for (int i = 0; i < courses.length; i++)
                  _buildCourseCard(courses[i], i),

                _buildCategorySection(
                  title: 'Cyber Security',
                  dotIndex: 0,
                ),
                _buildCategorySection(
                  title: 'Network Administrator',
                  dotIndex: 1,
                ),
                _buildCategorySection(
                  title: 'Cryptography',
                  dotIndex: 2,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    height: 25,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logoname.png'),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ),
                ),
          ),
          const SliverToBoxAdapter(
            child: Footer(),
          )
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  Widget _buildCourseCard(Course course, int activeDotIndex) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_forward_ios_outlined, color: Colors.orange),
              const SizedBox(width: 8),
              Text(
                course.label,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          width: 320,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  course.imageAsset,
                  width: double.infinity,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '"${course.description}"',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            bool isActive = index == activeDotIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 16 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive ? Colors.orange : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildCategorySection({
    required String title,
    required int dotIndex,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 24, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 3,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return const TabBarItem(
                image: 'assets/msword.png',
                label: 'Microsoft Word',
                description: 'កំរិតដំបូង និង បានរៀន',
                instructor: 'Mr. Bunthorn Liv',
                price: 39.99,
                buttonText: 'Start',
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            bool isActive = index == dotIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 16 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive ? Colors.orange : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
