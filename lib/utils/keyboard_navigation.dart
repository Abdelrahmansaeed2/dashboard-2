import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardNavigationHelper {
  // Focus nodes for keyboard navigation
  static final Map<String, FocusNode> _focusNodes = {};
  
  // Get or create a focus node for a specific key
  static FocusNode getFocusNode(String key) {
    if (!_focusNodes.containsKey(key)) {
      _focusNodes[key] = FocusNode(debugLabel: key);
    }
    return _focusNodes[key]!;
  }
  
  // Dispose all focus nodes
  static void dispose() {
    for (final node in _focusNodes.values) {
      node.dispose();
    }
    _focusNodes.clear();
  }
  
  // Create a keyboard handler for grid navigation
  static Widget createGridKeyboardHandler({
    required BuildContext context,
    required int itemCount,
    required int crossAxisCount,
    required Widget Function(int index) itemBuilder,
  }) {
    return Focus(
      autofocus: true,
      onKey: (FocusNode node, RawKeyEvent event) {
        if (event is! RawKeyDownEvent) return KeyEventResult.ignored;
        
        final currentFocus = FocusManager.instance.primaryFocus;
        if (currentFocus == null) return KeyEventResult.ignored;
        
        // Find the current index
        int currentIndex = -1;
        for (int i = 0; i < itemCount; i++) {
          if (_focusNodes.containsKey('item_$i') && 
              _focusNodes['item_$i'] == currentFocus) {
            currentIndex = i;
            break;
          }
        }
        
        if (currentIndex == -1) return KeyEventResult.ignored;
        
        // Calculate the next index based on key press
        int? nextIndex;
        
        switch (event.logicalKey) {
          case LogicalKeyboardKey.arrowRight:
            if (currentIndex < itemCount - 1) {
              nextIndex = currentIndex + 1;
            }
            break;
          case LogicalKeyboardKey.arrowLeft:
            if (currentIndex > 0) {
              nextIndex = currentIndex - 1;
            }
            break;
          case LogicalKeyboardKey.arrowDown:
            if (currentIndex + crossAxisCount < itemCount) {
              nextIndex = currentIndex + crossAxisCount;
            }
            break;
          case LogicalKeyboardKey.arrowUp:
            if (currentIndex - crossAxisCount >= 0) {
              nextIndex = currentIndex - crossAxisCount;
            }
            break;
          default:
            return KeyEventResult.ignored;
        }
        
        // Focus the next item if available
        if (nextIndex != null && _focusNodes.containsKey('item_$nextIndex')) {
          _focusNodes['item_$nextIndex']!.requestFocus();
          return KeyEventResult.handled;
        }
        
        return KeyEventResult.ignored;
      },
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Focus(
            focusNode: getFocusNode('item_$index'),
            child: itemBuilder(index),
          );
        },
      ),
    );
  }
}
