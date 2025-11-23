import 'package:flutter/material.dart';

class HomeItemCard extends StatelessWidget {
  const HomeItemCard({super.key, required this.imageUrl, required this.link});
  
  final String imageUrl;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(imageUrl, fit: BoxFit.fill),
      ),
    );
  }
}
