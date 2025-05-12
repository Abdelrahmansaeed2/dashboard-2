import 'package:flutter/material.dart';
import '../../domain/entities/item.dart';
import '../../utils/responsive_text.dart';
import '../../utils/image_helper.dart';
import 'package:flutter/semantics.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final bool isMobile;

  const ItemCard({
    Key? key,
    required this.item,
    this.isMobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Item card for ${item.title}',
      value: 'Status: ${item.status}, Date range: ${item.dateRange}, ${item.nights} nights',
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF171717),
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section with overlay
            Stack(
              children: [
                // Optimized image with caching
                ImageHelper.optimizedNetworkImage(
                  imageUrl: item.imageUrl,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                
                // More options button
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.white, size: 18),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      tooltip: 'More options',
                    ),
                  ),
                ),
                
                // Status badge
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color(0xFF484848),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Pending Approval',
                          style: ResponsiveText.caption(context).copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            // Content section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    item.title,
                    style: ResponsiveText.h3(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  // Date info
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Color(0xFF999999),
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${item.nights} Nights (${item.dateRange})',
                          style: ResponsiveText.caption(context),
                        ),
                      ],
                    ),
                  ),
                  
                  // Footer with avatars and task count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // User avatars
                      _buildUserAvatars(item, context),
                      
                      // Task count
                      Text(
                        '${item.unfinishedTasks} unfinished tasks',
                        style: ResponsiveText.caption(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserAvatars(Item item, BuildContext context) {
    // Show first 3 users and +X for the rest
    final displayedUsers = item.assignedUsers.take(3).toList();
    final remainingCount = item.assignedUsers.length - displayedUsers.length;

    return Semantics(
      label: '${item.assignedUsers.length} users assigned to this item',
      child: SizedBox(
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ImageHelper.optimizedNetworkImage(
                      imageUrl: displayedUsers[i].avatarUrl,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            
            // Show remaining count if needed
            if (remainingCount > 0)
              Positioned(
                left: displayedUsers.length * 16.0,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF484848),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF171717),
                      width: 2,
                    ),
                  ),
                  child: Center(
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
      ),
    );
  }
}
