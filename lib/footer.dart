import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top links section
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              // Left column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FooterText('About Us'),
                  FooterText('Contact Us'),
                  FooterText('FAQs'),
                  FooterText('Community Forum'),
                  FooterText('Term of Service'),
                  FooterText('Careers'),
                  FooterText('Leadership'),
                  FooterText('Blog'),
                ],
              ),
              // Right column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FooterText('Social Impact'),
                  FooterText('Cookies Setting'),
                  FooterText('Terms'),
                  FooterText('Accessibility Statement'),
                  FooterText('Investors'),
                  FooterText('GO Pro Course'),
                  FooterText('Affiliate'),
                ],
              ),
            ],
          ),
        ),

        // Certified Section
        const SizedBox(height: 16),
        const Text('Certified', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Image.asset(
          'assets/itc.png', 
          height: 100,
        ),

        const SizedBox(height: 24),
        const Divider(thickness: 1),

        // Social Media Icons
        const SizedBox(height: 16),
        SizedBox(
          width: 120,
          height: 30,
          child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              'assets/facebook.svg',
                width: 35,
                height: 20,
              ),
            SvgPicture.asset(
              'assets/linkedin.svg',
                width: 35,
                height: 20,
              ),
            SvgPicture.asset(
              'assets/youtube.svg',
                width: 35,
                height: 20,
              ),
          ],
        ),
        ),
        // Copyright
        const SizedBox(height: 8),
        const Text(
          '2023 © Worktency, Inc. All rights reserved.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class FooterText extends StatelessWidget {
  final String text;
  const FooterText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
