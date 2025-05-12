import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';
import '../screens/pricing_screen.dart';
import '../screens/info_screen.dart';
import '../screens/tasks_screen.dart';
import '../screens/analytics_screen.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  final String currentRoute;
  
  const AppDrawer({
    Key? key,
    required this.currentRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: SafeArea(
        child: Column(
          children: [
            // Header with logo and close button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'logo',
                    style: TextStyle(
                      color: Color(0xFFFFC268),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            
            const Divider(color: Color(0xFF262626)),
            
            // Navigation items
            _buildDrawerItem(
              context,
              'Items',
              Icons.inventory_2,
              currentRoute == '/' || currentRoute.contains('dashboard'),
              () => _navigateTo(context, const DashboardScreen()),
            ),
            _buildDrawerItem(
              context,
              'Pricing',
              Icons.attach_money,
              currentRoute.contains('pricing'),
              () => _navigateTo(context, const PricingScreen()),
            ),
            _buildDrawerItem(
              context,
              'Info',
              Icons.info,
              currentRoute.contains('info'),
              () => _navigateTo(context, const InfoScreen()),
            ),
            _buildDrawerItem(
              context,
              'Tasks',
              Icons.task,
              currentRoute.contains('tasks'),
              () => _navigateTo(context, const TasksScreen()),
            ),
            _buildDrawerItem(
              context,
              'Analytics',
              Icons.analytics,
              currentRoute.contains('analytics'),
              () => _navigateTo(context, const AnalyticsScreen()),
            ),
            
            const Divider(color: Color(0xFF262626)),
            
            // User profile section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://randomuser.me/api/portraits/men/32.jpg',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'john.doe@example.com',
                          style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Settings and logout
            _buildDrawerItem(
              context,
              'Settings',
              Icons.settings,
              false,
              () {},
            ),
            _buildDrawerItem(
              context,
              'Logout',
              Icons.logout,
              false,
              () {
                // Handle logout
                Navigator.of(context).pop();
                // You would call your auth provider's signOut method here
              },
              textColor: const Color(0xFFFFC268),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    String title,
    IconData icon,
    bool isActive,
    VoidCallback onTap, {
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? const Color(0xFFFFC268) : (textColor ?? const Color(0xFF999999)),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : (textColor ?? const Color(0xFF999999)),
        ),
      ),
      onTap: onTap,
      selected: isActive,
      selectedTileColor: const Color(0xFF171717),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.of(context).pop(); // Close drawer
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => screen),
    );
  }
}
