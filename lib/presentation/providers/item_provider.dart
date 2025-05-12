import 'package:flutter/material.dart';
import '../../domain/entities/item.dart';
import '../../domain/entities/user.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> _items = [];
  bool _isLoading = true;

  List<Item> get items => _items;
  bool get isLoading => _isLoading;

  Future<void> loadItems() async {
    _isLoading = true;
    notifyListeners();

    // Simulate loading delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Load mock data that matches the Figma design
    _items = _getMockItems();
    
    _isLoading = false;
    notifyListeners();
  }

  // Mock data that exactly matches the Figma design
  List<Item> _getMockItems() {
    final mockUsers = [
      User(id: '1', name: 'User 1', avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg'),
      User(id: '2', name: 'User 2', avatarUrl: 'https://randomuser.me/api/portraits/women/44.jpg'),
      User(id: '3', name: 'User 3', avatarUrl: 'https://randomuser.me/api/portraits/men/46.jpg'),
      User(id: '4', name: 'User 4', avatarUrl: 'https://randomuser.me/api/portraits/women/65.jpg'),
      User(id: '5', name: 'User 5', avatarUrl: 'https://randomuser.me/api/portraits/men/63.jpg'),
      User(id: '6', name: 'User 6', avatarUrl: 'https://randomuser.me/api/portraits/women/58.jpg'),
    ];

    // Exact images from the Figma design provided by the user
    const palmTreesImage = 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Rectangle%201208-XnFJc9YmN9oaWWsbq6AkKKKm5vc88O.png'; // LA palm trees sunset
    const miamiSkylineImage = 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Group%2036796-wttAEXKcYvAUyaWCkeqmBqzTuKYxbT.png'; // Miami skyline sunset
    const beachPierImage = 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Group36796-gRcFDuBk71jNIAuXDc8tQka7m6uMHc.png'; // Tropical beach pier

    return [
      Item(
        id: '1',
        title: 'Item title',
        imageUrl: palmTreesImage,
        dateRange: 'Jan 16 - Jan 20, 2024',
        nights: 5,
        unfinishedTasks: 4,
        assignedUsers: mockUsers.sublist(0, 6),
        status: 'Pending Approval',
      ),
      Item(
        id: '2',
        title: 'Long item title highlighti...',
        imageUrl: miamiSkylineImage,
        dateRange: 'Jan 16 - Jan 20, 2024',
        nights: 5,
        unfinishedTasks: 4,
        assignedUsers: mockUsers.sublist(0, 6),
        status: 'Pending Approval',
      ),
      Item(
        id: '3',
        title: 'Item title',
        imageUrl: palmTreesImage,
        dateRange: 'Jan 16 - Jan 20, 2024',
        nights: 5,
        unfinishedTasks: 4,
        assignedUsers: mockUsers.sublist(0, 6),
        status: 'Pending Approval',
      ),
      Item(
        id: '4',
        title: 'Item title',
        imageUrl: beachPierImage,
        dateRange: 'Jan 16 - Jan 20, 2024',
        nights: 5,
        unfinishedTasks: 4,
        assignedUsers: mockUsers.sublist(0, 6),
        status: 'Pending Approval',
      ),
      Item(
        id: '5',
        title: 'Item title',
        imageUrl: palmTreesImage,
        dateRange: 'Jan 16 - Jan 20, 2024',
        nights: 5,
        unfinishedTasks: 4,
        assignedUsers: mockUsers.sublist(0, 6),
        status: 'Pending Approval',
      ),
      Item(
        id: '6',
        title: 'Item title',
        imageUrl: miamiSkylineImage,
        dateRange: 'Jan 16 - Jan 20, 2024',
        nights: 5,
        unfinishedTasks: 4,
        assignedUsers: mockUsers.sublist(0, 6),
        status: 'Pending Approval',
      ),
      Item(
        id: '7',
        title: 'Item title',
        imageUrl: palmTreesImage,
        dateRange: 'Jan 16 - Jan 20, 2024',
        nights: 5,
        unfinishedTasks: 4,
        assignedUsers: mockUsers.sublist(0, 6),
        status: 'Pending Approval',
      ),
      Item(
        id: '8',
        title: 'Item title',
        imageUrl: miamiSkylineImage,
        dateRange: 'Jan 16 - Jan 20, 2024',
        nights: 5,
        unfinishedTasks: 4,
        assignedUsers: mockUsers.sublist(0, 6),
        status: 'Pending Approval',
      ),
    ];
  }
}
