import 'package:flutter/material.dart';

class CustomFeaturedCourse extends StatelessWidget {
  const CustomFeaturedCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 250,  
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              TabBarItem(
                image: 'assets/msword.png',
                label: 'Microsoft Word',
                description: 'កំរិតដំបូង និង បានរៀន',
                instructor: 'Mr. Bunthorn Liv',
                price: 39.99,
                buttonText: 'Start',
              ),
              SizedBox(width: 16),
              TabBarItem(
                image: 'assets/msword.png',
                label: 'Microsoft Word',
                description: 'កំរិតដំបូង និង បានរៀន',
                instructor: 'Mr. Bunthorn Liv',
                price: 39.99,
                buttonText: 'Start',
              ),
              SizedBox(width: 16),
              TabBarItem(
                image: 'assets/msword.png',
                label: 'Microsoft Word',
                description: 'កំរិតដំបូង និង បានរៀន',
                instructor: 'Mr. Bunthorn Liv',
                price: 39.99,
                buttonText: 'Start',
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 250,  
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              TabBarItem(
                image: 'assets/msword.png',
                label: 'Microsoft Word',
                description: 'កំរិតដំបូង និង បានរៀន',
                instructor: 'Mr. Bunthorn Liv',
                price: 39.99,
                buttonText: 'Start',
              ),
              SizedBox(width: 16),
              TabBarItem(
                image: 'assets/msword.png',
                label: 'Microsoft Word',
                description: 'កំរិតដំបូង និង បានរៀន',
                instructor: 'Mr. Bunthorn Liv',
                price: 39.99,
                buttonText: 'Start',
              ),
              SizedBox(width: 16),
              TabBarItem(
                image: 'assets/msword.png',
                label: 'Microsoft Word',
                description: 'កំរិតដំបូង និង បានរៀន',
                instructor: 'Mr. Bunthorn Liv',
                price: 39.99,
                buttonText: 'Start',
              ),
            ],
          ),
        ),
        
      ],
    );
  }
}

class TabBarItem extends StatelessWidget {
  final String image;
  final String label;
  final String description;
  final String instructor;
  final double price;
  final String buttonText;

  const TabBarItem({
    super.key,
    required this.label,
    required this.description,
    required this.image,
    required this.instructor,
    required this.price,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course image
          Center(
            child: Image.asset(
              image,
              height: 60,
              width: 60,
            ),
          ),
          const SizedBox(height: 12),

          // Title
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // level
          const Row(
            children:  [
              Icon(Icons.wifi_2_bar, size: 14, color: Colors.grey),
              SizedBox(width: 4),
              Text("កំរិតដំបូង", style: TextStyle(fontSize: 12, color: Colors.grey)),
              SizedBox(width: 15),
              Icon(Icons.people, size: 14, color: Colors.grey),
              SizedBox(width: 4),
              Text("99 នាក់បានរៀន", style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 10),

          // Instructor row
          Row(
            children: [
              const CircleAvatar(
                radius: 12,
                backgroundImage: AssetImage('assets/teacherBunthorn.png'),  
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      instructor,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      'Professor @ITC',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$$price',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 80, 
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    backgroundColor: Colors.blue.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Start", style: TextStyle(fontSize: 14,color: Colors.blue)),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward, size: 14,color: Colors.blue,),
                    ],
                  ),
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}

