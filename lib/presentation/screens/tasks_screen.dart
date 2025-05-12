import 'package:flutter/material.dart';
import '../widgets/app_navigation_bar.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<Map<String, dynamic>> _tasks = [
    {
      'id': '1',
      'title': 'Review item details for Palm Trees',
      'dueDate': 'Today',
      'priority': 'High',
      'isCompleted': false,
      'assignedTo': 'John Doe',
    },
    {
      'id': '2',
      'title': 'Update pricing information for Miami Skyline',
      'dueDate': 'Tomorrow',
      'priority': 'Medium',
      'isCompleted': false,
      'assignedTo': 'John Doe',
    },
    {
      'id': '3',
      'title': 'Confirm availability for Beach Pier',
      'dueDate': 'May 15, 2025',
      'priority': 'Low',
      'isCompleted': false,
      'assignedTo': 'Jane Smith',
    },
    {
      'id': '4',
      'title': 'Verify location details for Downtown',
      'dueDate': 'May 18, 2025',
      'priority': 'Medium',
      'isCompleted': false,
      'assignedTo': 'John Doe',
    },
    {
      'id': '5',
      'title': 'Upload new photos for Palm Trees',
      'dueDate': 'May 12, 2025',
      'priority': 'High',
      'isCompleted': true,
      'assignedTo': 'John Doe',
    },
    {
      'id': '6',
      'title': 'Respond to customer inquiry about Beach Pier',
      'dueDate': 'May 11, 2025',
      'priority': 'High',
      'isCompleted': true,
      'assignedTo': 'Jane Smith',
    },
  ];

  String _filterStatus = 'All';
  String _filterPriority = 'All';

  List<Map<String, dynamic>> get _filteredTasks {
    return _tasks.where((task) {
      // Filter by status
      if (_filterStatus == 'Completed' && !task['isCompleted']) return false;
      if (_filterStatus == 'Pending' && task['isCompleted']) return false;
      
      // Filter by priority
      if (_filterPriority != 'All' && task['priority'] != _filterPriority) return false;
      
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFC268),
        onPressed: () {
          // Add new task
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
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
                  // Header with title and filters
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tasks',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Row(
                        children: [
                          // Status filter
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF171717),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _filterStatus,
                                dropdownColor: const Color(0xFF171717),
                                style: const TextStyle(color: Colors.white),
                                icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF999999)),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'All',
                                    child: Text('All Tasks'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Pending',
                                    child: Text('Pending'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Completed',
                                    child: Text('Completed'),
                                  ),
                                ],
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _filterStatus = value;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          
                          // Priority filter
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF171717),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _filterPriority,
                                dropdownColor: const Color(0xFF171717),
                                style: const TextStyle(color: Colors.white),
                                icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF999999)),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'All',
                                    child: Text('All Priorities'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'High',
                                    child: Text('High'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Medium',
                                    child: Text('Medium'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Low',
                                    child: Text('Low'),
                                  ),
                                ],
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _filterPriority = value;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Tasks list
                  Expanded(
                    child: _filteredTasks.isEmpty
                        ? const Center(
                            child: Text(
                              'No tasks found',
                              style: TextStyle(color: Color(0xFF999999)),
                            ),
                          )
                        : ListView.separated(
                            itemCount: _filteredTasks.length,
                            separatorBuilder: (context, index) => const Divider(
                              color: Color(0xFF262626),
                              height: 1,
                            ),
                            itemBuilder: (context, index) {
                              final task = _filteredTasks[index];
                              return _buildTaskItem(task);
                            },
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

  Widget _buildTaskItem(Map<String, dynamic> task) {
    Color priorityColor;
    switch (task['priority']) {
      case 'High':
        priorityColor = Colors.red;
        break;
      case 'Medium':
        priorityColor = Colors.orange;
        break;
      case 'Low':
        priorityColor = Colors.green;
        break;
      default:
        priorityColor = Colors.grey;
    }

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      leading: Checkbox(
        value: task['isCompleted'],
        activeColor: const Color(0xFFFFC268),
        checkColor: Colors.black,
        shape: const CircleBorder(),
        onChanged: (value) {
          setState(() {
            task['isCompleted'] = value;
          });
        },
      ),
      title: Text(
        task['title'],
        style: TextStyle(
          color: task['isCompleted'] ? const Color(0xFF999999) : Colors.white,
          decoration: task['isCompleted'] ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: priorityColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                task['priority'],
                style: TextStyle(
                  color: priorityColor,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.calendar_today,
              color: Color(0xFF999999),
              size: 12,
            ),
            const SizedBox(width: 4),
            Text(
              task['dueDate'],
              style: const TextStyle(
                color: Color(0xFF999999),
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.person,
              color: Color(0xFF999999),
              size: 12,
            ),
            const SizedBox(width: 4),
            Text(
              task['assignedTo'],
              style: const TextStyle(
                color: Color(0xFF999999),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert, color: Color(0xFF999999)),
        onPressed: () {
          // Show task options
        },
      ),
    );
  }
}
