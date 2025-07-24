import 'package:flutter/material.dart';

class MerchantCard extends StatelessWidget {
  final String brandName;
  final String title;
  final String subtitle;
  final String imagePath;
  final Color brandColor;

  const MerchantCard({
    super.key,
    required this.brandName,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.brandColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: Color(0xFFE9ECF2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: brandColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(Icons.payment, color: Colors.white, size: 12),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      brandName,
                      style: TextStyle(
                        color: brandColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    if (brandName.contains('Pay'))
                      Text(
                        '®',
                        style: TextStyle(color: brandColor, fontSize: 9),
                      ),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 1),
                Text(subtitle, style: TextStyle(fontSize: 11)),
              ],
            ),
          ),
          SizedBox(width: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 45,
              height: 45,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: brandColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.person, color: brandColor, size: 25),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
