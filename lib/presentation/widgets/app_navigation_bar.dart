import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';
import '../screens/pricing_screen.dart';
import '../screens/info_screen.dart';
import '../screens/tasks_screen.dart';
import '../screens/analytics_screen.dart';
import '../screens/login_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine current route
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';
    final isItemsActive = currentRoute == '/' || currentRoute.contains('dashboard');
    final isPricingActive = currentRoute.contains('pricing');
    final isInfoActive = currentRoute.contains('info');
    final isTasksActive = currentRoute.contains('tasks');
    final isAnalyticsActive = currentRoute.contains('analytics');

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF262626),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          // Logo
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const DashboardScreen()),
              );
            },
            child: const Text(
              'logo',
              style: TextStyle(
                color: Color(0xFFFFC268),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          
          // Navigation items - only show on larger screens
          if (MediaQuery.of(context).size.width > 768)
            Row(
              children: [
                _buildNavItem(
                  context, 
                  'Items', 
                  isItemsActive, 
                  () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const DashboardScreen()),
                  ),
                ),
                _buildNavItem(
                  context, 
                  'Pricing', 
                  isPricingActive, 
                  () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const PricingScreen()),
                  ),
                ),
                _buildNavItem(
                  context, 
                  'Info', 
                  isInfoActive, 
                  () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const InfoScreen()),
                  ),
                ),
                _buildNavItem(
                  context, 
                  'Tasks', 
                  isTasksActive, 
                  () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const TasksScreen()),
                  ),
                ),
                _buildNavItem(
                  context, 
                  'Analytics', 
                  isAnalyticsActive, 
                  () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const AnalyticsScreen()),
                  ),
                ),
              ],
            ),
          const Spacer(),
          
          // Action icons and profile
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.settings, color: Color(0xFF999999)),
                onPressed: () {
                  // Open settings
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications, color: Color(0xFF999999)),
                onPressed: () {
                  // Open notifications
                },
              ),
              const SizedBox(width: 16),
              // Profile section with dropdown
              _buildProfileDropdown(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, bool isActive, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isActive ? Colors.white : const Color(0xFF999999),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            if (isActive)
              Container(
                height: 2,
                width: 20,
                color: const Color(0xFFFFC268),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDropdown(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: const Color(0xFF171717),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/32',
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'John Doe',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF999999),
            size: 16,
          ),
        ],
      ),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'profile',
          child: Row(
            children: [
              Icon(Icons.person, color: Color(0xFF999999)),
              SizedBox(width: 8),
              Text('Profile', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'settings',
          child: Row(
            children: [
              Icon(Icons.settings, color: Color(0xFF999999)),
              SizedBox(width: 8),
              Text('Settings', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          value: 'logout',
          child: Row(
            children: [
              Icon(Icons.logout, color: Color(0xFF999999)),
              SizedBox(width: 8),
              Text('Logout', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
      onSelected: (value) async {
        if (value == 'logout') {
          // Handle logout
          final authProvider = Provider.of<AuthProvider>(context, listen: false);
          await authProvider.signOut();
          
          if (context.mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
          }
        }
      },
    );
  }
}
