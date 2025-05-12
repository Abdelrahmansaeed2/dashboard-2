import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';
import '../widgets/item_card.dart';
import '../widgets/app_drawer.dart';
import '../../utils/responsive_text.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  void initState() {
    super.initState();
    // Load items when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ItemProvider>(context, listen: false).loadItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    final items = itemProvider.items;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    // Determine number of grid columns based on screen width
    int crossAxisCount = 1;
    if (screenWidth > 600) crossAxisCount = 2;
    if (screenWidth > 900) crossAxisCount = 3;
    if (screenWidth > 1200) crossAxisCount = 4;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      drawer: AppDrawer(currentRoute: '/'),
      body: Column(
        children: [
          // Navigation Bar - Exactly matching the screenshot
          _buildMobileNavigationBar(),
          
          // Main content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with title and actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Items',
                        style: ResponsiveText.h1(context),
                      ),
                      Row(
                        children: [
                          // Filter button
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF171717),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.tune,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Add new item button
                          ElevatedButton.icon(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 20,
                            ),
                            label: Text(
                              'Add a New Item',
                              style: ResponsiveText.button(context),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFC268),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Grid or List of items based on screen size
                  Expanded(
                    child: itemProvider.isLoading
                        ? const Center(child: CircularProgressIndicator(color: Color(0xFFFFC268)))
                        : isMobile
                            // List view for mobile
                            ? ListView.separated(
                                itemCount: items.length,
                                separatorBuilder: (context, index) => const SizedBox(height: 16),
                                itemBuilder: (context, index) {
                                  return ItemCard(
                                    item: items[index],
                                    isMobile: true,
                                  );
                                },
                              )
                            // Grid view for larger screens
                            : GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 0.85,
                                ),
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return ItemCard(
                                    item: items[index],
                                    isMobile: false,
                                  );
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

  // Mobile navigation bar exactly matching the screenshot
  Widget _buildMobileNavigationBar() {
    return Container(
      color: Colors.black,
      height: 56,
      child: Row(
        children: [
          // Hamburger menu - exactly as in screenshot
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 12.0),
            child: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          
          // Logo - positioned right next to hamburger menu
          const Text(
            'logo',
            style: TextStyle(
              color: Color(0xFFFFC268),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          const Spacer(),
          
          // Settings icon
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.settings,
              color: Colors.white,
              size: 24,
            ),
          ),
          
          // Notifications icon
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 24,
            ),
          ),
          
          // Profile picture
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: const NetworkImage(
                'https://randomuser.me/api/portraits/men/32.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Desktop navigation bar (not used in mobile)
  Widget _buildDesktopNavigationBar() {
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
          const Text(
            'logo',
            style: TextStyle(
              color: Color(0xFFFFC268),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          
          // Navigation items
          Row(
            children: [
              _buildNavItem('Items', true),
              _buildNavItem('Pricing', false),
              _buildNavItem('Info', false),
              _buildNavItem('Tasks', false),
              _buildNavItem('Analytics', false),
            ],
          ),
          const Spacer(),
          
          // Action icons and profile
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.settings, color: Color(0xFF999999)),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications, color: Color(0xFF999999)),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              // Profile section
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://randomuser.me/api/portraits/men/32.jpg',
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
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
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, bool isActive) {
    return Padding(
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
    );
  }
}
