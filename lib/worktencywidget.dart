import 'package:flutter/material.dart';

class Worktencywidget extends StatelessWidget {
  const Worktencywidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Why Choose Worktency?",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 220,  
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              ContainerItem(
                image: 'assets/expert_instructor.png',
                title: 'Expert Instructors',
              ),
              SizedBox(width: 16),
              ContainerItem(
                image: 'assets/flexible.png', 
                title: 'Flexible Learning',
              ),
              SizedBox(width: 16),
              ContainerItem(
                image: 'assets/handon.png',
                title: 'Hand-on Learning',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class ContainerItem extends StatelessWidget {
  final String image;
  final String title;

  const ContainerItem({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 130,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange.shade100),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
