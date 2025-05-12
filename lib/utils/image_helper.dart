import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageHelper {
  // Custom cache manager for our app
  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 100,
    ),
  );
  
  // Optimized network image with caching and lazy loading
  static Widget optimizedNetworkImage({
    required String imageUrl,
    required double width,
    required double height,
    BoxFit fit = BoxFit.cover,
    Widget? placeholder,
    Widget? errorWidget,
    BorderRadius? borderRadius,
    bool enableMemoryCache = true,
  }) {
    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      cacheManager: customCacheManager,
      memCacheWidth: enableMemoryCache ? (width * 2).toInt() : null,
      placeholder: (context, url) => placeholder ?? Container(
        color: const Color(0xFF262626),
        child: const Center(
          child: CircularProgressIndicator(
            color: Color(0xFFFFC268),
            strokeWidth: 2,
          ),
        ),
      ),
      errorWidget: (context, url, error) => errorWidget ?? Container(
        color: const Color(0xFF262626),
        child: const Center(
          child: Icon(
            Icons.error_outline,
            color: Color(0xFF999999),
          ),
        ),
      ),
    );
    
    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: image,
      );
    }
    
    return image;
  }
}
