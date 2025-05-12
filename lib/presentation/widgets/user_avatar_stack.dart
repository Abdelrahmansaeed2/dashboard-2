import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';

class UserAvatarStack extends StatelessWidget {
  final List<User> users;
  final int maxDisplayed;

  const UserAvatarStack({
    Key? key,
    required this.users,
    this.maxDisplayed = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayedUsers = users.take(maxDisplayed).toList();
    final remainingCount = users.length - displayedUsers.length;

    return SizedBox(
      height: 24,
      child: Stack(
        children: [
          // Display avatars with overlap
          for (int i = 0; i < displayedUsers.length; i++)
            Positioned(
              left: i * 16.0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF171717),
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(displayedUsers[i].avatarUrl),
                ),
              ),
            ),
          
          // Show remaining count if needed
          if (remainingCount > 0)
            Positioned(
              left: displayedUsers.length * 16.0,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF484848),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF171717),
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.transparent,
                  child: Text(
                    '+$remainingCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
