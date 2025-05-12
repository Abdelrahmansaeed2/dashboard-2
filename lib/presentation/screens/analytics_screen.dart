import 'package:flutter/material.dart';
import '../widgets/app_navigation_bar.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

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
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Analytics',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 32),
                  
                  // Analytics dashboard
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Summary cards
                          _buildSummaryCards(context),
                          const SizedBox(height: 32),
                          
                          // Charts
                          _buildCharts(context),
                          const SizedBox(height: 32),
                          
                          // Recent activity
                          _buildRecentActivity(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive layout
        final isWide = constraints.maxWidth > 768;
        
        if (isWide) {
          return Row(
            children: [
              Expanded(child: _buildSummaryCard('Total Items', '24', Icons.inventory_2, Colors.blue)),
              const SizedBox(width: 16),
              Expanded(child: _buildSummaryCard('Pending Approval', '8', Icons.pending_actions, Colors.orange)),
              const SizedBox(width: 16),
              Expanded(child: _buildSummaryCard('Completed', '12', Icons.check_circle, Colors.green)),
              const SizedBox(width: 16),
              Expanded(child: _buildSummaryCard('Unfinished Tasks', '32', Icons.assignment_late, Colors.red)),
            ],
          );
        } else {
          return Column(
            children: [
              _buildSummaryCard('Total Items', '24', Icons.inventory_2, Colors.blue),
              const SizedBox(height: 16),
              _buildSummaryCard('Pending Approval', '8', Icons.pending_actions, Colors.orange),
              const SizedBox(height: 16),
              _buildSummaryCard('Completed', '12', Icons.check_circle, Colors.green),
              const SizedBox(height: 16),
              _buildSummaryCard('Unfinished Tasks', '32', Icons.assignment_late, Colors.red),
            ],
          );
        }
      },
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharts(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive layout
        final isWide = constraints.maxWidth > 768;
        
        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildChartCard('Items by Status', 'Donut Chart')),
              const SizedBox(width: 24),
              Expanded(child: _buildChartCard('Activity Over Time', 'Line Chart')),
            ],
          );
        } else {
          return Column(
            children: [
              _buildChartCard('Items by Status', 'Donut Chart'),
              const SizedBox(height: 24),
              _buildChartCard('Activity Over Time', 'Line Chart'),
            ],
          );
        }
      },
    );
  }

  Widget _buildChartCard(String title, String chartType) {
    return Container(
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
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Container(
              height: 200,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF262626),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                chartType,
                style: const TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Activity',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          _buildActivityItem(
            'Item title was approved',
            '2 hours ago',
            Icons.check_circle,
            Colors.green,
          ),
          const Divider(color: Color(0xFF262626)),
          _buildActivityItem(
            'New item added: Beach Pier',
            '5 hours ago',
            Icons.add_circle,
            Colors.blue,
          ),
          const Divider(color: Color(0xFF262626)),
          _buildActivityItem(
            'Task completed: Update pricing',
            '1 day ago',
            Icons.task_alt,
            Colors.purple,
          ),
          const Divider(color: Color(0xFF262626)),
          _buildActivityItem(
            'Item title was rejected',
            '2 days ago',
            Icons.cancel,
            Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, String time, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
