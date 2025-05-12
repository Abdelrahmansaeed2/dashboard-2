import 'user.dart';

class Item {
  final String id;
  final String title;
  final String imageUrl;
  final String dateRange;
  final int nights;
  final int unfinishedTasks;
  final List<User> assignedUsers;
  final String status;

  Item({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.dateRange,
    required this.nights,
    required this.unfinishedTasks,
    required this.assignedUsers,
    required this.status,
  });
}
