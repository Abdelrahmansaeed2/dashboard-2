import 'package:flutter/material.dart';
import '../widgets/app_navigation_bar.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Custom app bar
          const AppNavigationBar(),
          
          // Main content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Information',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 32),
                    
                    // About section
                    _buildSection(
                      title: 'About',
                      content: 'This dashboard application allows you to manage items, track tasks, and analyze performance. It is built with Flutter and Firebase, providing a responsive and intuitive user interface across all devices.',
                    ),
                    const SizedBox(height: 32),
                    
                    // Features section
                    _buildSection(
                      title: 'Features',
                      content: '',
                      children: [
                        _buildFeatureItem(
                          icon: Icons.inventory_2,
                          title: 'Item Management',
                          description: 'Create, edit, and manage items with detailed information.',
                        ),
                        _buildFeatureItem(
                          icon: Icons.task_alt,
                          title: 'Task Tracking',
                          description: 'Assign and track tasks with priorities and due dates.',
                        ),
                        _buildFeatureItem(
                          icon: Icons.analytics,
                          title: 'Analytics',
                          description: 'View performance metrics and activity trends.',
                        ),
                        _buildFeatureItem(
                          icon: Icons.people,
                          title: 'User Management',
                          description: 'Assign users to items and tasks for collaborative work.',
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    
                    // FAQ section
                    _buildSection(
                      title: 'Frequently Asked Questions',
                      content: '',
                      children: [
                        _buildFaqItem(
                          question: 'How do I add a new item?',
                          answer: 'Click on the "Add a New Item" button on the Items page. Fill in the required information and click Save.',
                        ),
                        _buildFaqItem(
                          question: 'Can I assign multiple users to an item?',
                          answer: 'Yes, you can assign multiple users to an item. Go to the item details page and click on "Assign User".',
                        ),
                        _buildFaqItem(
                          question: 'How do I change the status of an item?',
                          answer: 'You can change the status of an item by clicking on the status dropdown on the item card or in the item details page.',
                        ),
                        _buildFaqItem(
                          question: 'Is there a mobile app available?',
                          answer: 'Yes, this application is built with Flutter and works on both web and mobile platforms.',
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    
                    // Contact section
                    _buildSection(
                      title: 'Contact Us',
                      content: 'If you have any questions or need assistance, please contact our support team.',
                      children: [
                        _buildContactItem(
                          icon: Icons.email,
                          title: 'Email',
                          value: 'support@example.com',
                        ),
                        _buildContactItem(
                          icon: Icons.phone,
                          title: 'Phone',
                          value: '+1 (123) 456-7890',
                        ),
                        _buildContactItem(
                          icon: Icons.location_on,
                          title: 'Address',
                          value: '123 Main Street, City, Country',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    List<Widget> children = const [],
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (content.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(
                color: Color(0xFF999999),
                fontSize: 16,
              ),
            ),
          ],
          if (children.isNotEmpty) ...[
            const SizedBox(height: 24),
            ...children,
          ],
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFC268).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFFFFC268)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqItem({
    required String question,
    required String answer,
  }) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: Text(
        question,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconColor: const Color(0xFFFFC268),
      collapsedIconColor: const Color(0xFF999999),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            answer,
            style: const TextStyle(
              color: Color(0xFF999999),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFFFC268)),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 14,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
