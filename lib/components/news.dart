import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String image;
  final String source;
  final String date;
  final VoidCallback onTap;

  const NewsCard({
    super.key,
    required this.title,
    required this.image,
    required this.source,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 80),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(source, style: const TextStyle(color: Colors.grey)),
                      Text(date, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class News extends StatelessWidget {
//   final String? title, image;
//
//   const News({super.key, this.title, this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10.0),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 150,
//             child: AspectRatio(
//               aspectRatio: 4/3,
//               child: FancyShimmerImage(
//                 boxFit: BoxFit.cover,
//                 imageUrl: image ?? '',
//               ),
//             ),
//           ),
//           SizedBox(width: 20),
//           Expanded(
//             child: Text(
//               title ?? '',
//               style: TextStyle(fontWeight: FontWeight.bold),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }