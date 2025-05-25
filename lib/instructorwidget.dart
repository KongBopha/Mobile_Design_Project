import 'package:flutter/material.dart';

class Instructorwidget extends StatelessWidget {
  const Instructorwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Meet Our Teachers",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children:[
              Container(
                width: 110,
                decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Dr_dona.png'),fit: BoxFit.contain)
                ),
              ),
              const SizedBox(width: 12,),
              Container(
                width: 110,
                decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/teacherTin.png'),fit: BoxFit.contain)
                ),
              ),
              const SizedBox(width: 12,),
              Container(
                width: 110,
                decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/teacherpisey.png'),fit: BoxFit.contain)
                ),
              ),
            ],
          ),
        ),
      ],

    );
  }
}