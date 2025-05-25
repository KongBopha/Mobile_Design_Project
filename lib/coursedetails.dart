import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Coursedetails extends StatelessWidget {
  const Coursedetails({super.key});

  @override
  Widget build(BuildContext context) {
       final List<PostData> posts = [
      const PostData(
        imageUrl: 'assets/meeting.png',
        quote:
            '"Machine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate”"',
        author: ['Dr. Valy Dona ', 'Professor @ITC, Cofounder @Worktency'],
        tags: ['Machine Learning' ,' Artificial Intelligence'],
      ),
      const PostData(
        imageUrl: 'assets/meeting.png',
        quote:
            '"Machine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate”"',
        author: ['Dr. Valy Dona ', 'Professor @ITC, Cofounder @Worktency'],
        tags: ['Machine Learning' ,' Artificial Intelligence'],
      ),
      const PostData(
        imageUrl: 'assets/meeting.png',
        quote:
            '"Machine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate”"',
        author: ['Dr. Valy Dona ', 'Professor @ITC, Cofounder @Worktency'],
        tags: ['Machine Learning' ,' Artificial Intelligence'],
      ),
      const PostData(
        imageUrl: 'assets/meeting.png',
        quote:
            '"Machine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate”"',
        author: ['Dr. Valy Dona ', 'Professor @ITC, Cofounder @Worktency'],
        tags: ['Machine Learning' ,' Artificial Intelligence'],
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context, index) => PostCard(data: posts[index]),
    );
  }
}
class PostData {
  final String imageUrl;
  final String quote;
  final List <String> author;
  final List <String> tags;

  const PostData({
    required this.imageUrl,
    required this.quote,
    required this.author,
    required this.tags,
  });
}

class PostCard extends StatelessWidget {
  final PostData data;

  const PostCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
         
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Left Side: Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              data.imageUrl,
              height: 120,
              width: 120,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(width: 12),

          /// Right Side: Text & Tags
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.quote,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: data.author[0],
                      style: const TextStyle(fontSize: 9,color: Colors.black,fontWeight: FontWeight.bold)
                    ),
                    const WidgetSpan(child: SizedBox(width: 5)),
                    TextSpan(
                      text: data.author[1],
                      style: const TextStyle(fontSize: 8,color: Colors.grey)

                    )
                  ]
                )
                ),
                const SizedBox(height: 10),
                Container(
                  width: 130,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius:const BorderRadius.all(Radius.circular(8)),
                    color: Colors.grey[100],
                  ),
                  child: Column(
                    children: [
                       Row(
                        children: [
                          SvgPicture.asset(
                            'assets/ml.svg',
                            height: 16,
                            width: 16,
                            colorFilter: const ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            data.tags[0],  
                            style: const TextStyle(fontSize: 10, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  width: 130,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius:const BorderRadius.all(Radius.circular(8)),
                    color: Colors.grey[100],
                  ),
                  child: Column(
                    children: [
                       Row(
                        children: [
                          SvgPicture.asset(
                            'assets/AI.svg',
                            height: 16,
                            width: 16,
                            colorFilter: const ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            data.tags[1],  
                            style: const TextStyle(fontSize: 10, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
        
      ),
    );
  }
}