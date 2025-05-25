import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16), // Margin around the bar
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), // Rounded corners
        boxShadow:const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset:  Offset(0, 4),
          ),
        ],
      ),
      child:const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          NavItem(icon: Icons.search, label: 'Explore'),
          NavItem(icon: Icons.assignment, label: 'My courses'),
          NavItem(
            icon: Icons.play_circle_fill,
            label: 'Online course',
            isActive: true,
            activeColor: Colors.orange,
          ),
          NavItem(icon: Icons.layers, label: 'Category'),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final Color activeColor;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    this.isActive = false,
    this.activeColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? activeColor : Colors.black,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isActive ? activeColor : Colors.black,
          ),
        ),
      ],
    );
  }
}
