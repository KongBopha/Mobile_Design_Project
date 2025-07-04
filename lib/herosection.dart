import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:landing_page/custombottombar.dart';
import 'package:landing_page/featuredcourse.dart';
import 'package:landing_page/footer.dart';
import 'package:landing_page/instructorwidget.dart';
import 'package:landing_page/searchcourse.dart';
import 'package:landing_page/worktencywidget.dart';
import 'package:landing_page/coursedetails.dart';

class Herosection extends StatelessWidget {
  const Herosection({super.key});

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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 20),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      text: 'Unlock Your Potential\n with',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: '\t\tWorktency',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Discover industry-leading courses designed to equip you\n with real-world skills. Join our community and start your\n journey to success today.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/herocontent.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(  
                  child: Container(
                    height: 40,
                    width: 200,  
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        minimumSize: const Size(0, 40), // Prevent expanding
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.menu_book_rounded, color: Colors.blue),
                      label: Text(
                        "Explore Courses",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Container(
                    height: 40,
                    width: 220,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/presentation.png',
                          height: 24,
                          width: 24,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Join as an educator',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Worktencywidget(),
                const SizedBox(height: 20),
                const Featuredcourse(),
                const SizedBox(height: 20),
                const Instructorwidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      'assets/arrow_left.svg',
                      width: 50,
                      height: 29,
                    ),
                    const Text('To reach our only One goal,\nwhat we can share with you today'),
                  ],
                ),
                const Coursedetails(),
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'See more',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
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
                const Footer(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
