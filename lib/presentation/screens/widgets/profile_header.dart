import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String imagePath;
  final String name;
  final String balance;
  final VoidCallback onMenuTap;

  const ProfileHeader({
    super.key,
    required this.imagePath,
    required this.name,
    required this.balance,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  balance,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: onMenuTap,
          child: const Icon(Icons.menu, color: Colors.white, size: 30),
        ),
      ],
    );
  }
}
