import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/item.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/item_repository.dart';
import '../datasources/item_data_source.dart';

class ItemRepositoryImpl implements ItemRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ItemDataSource _dataSource = FirestoreItemDataSource();

  @override
  Future<List<Item>> getItems() async {
    try {
      return await _dataSource.getItems();
    } catch (e) {
      // If Firebase fails, return empty list
      return [];
    }
  }

  @override
  Future<Item> getItemById(String id) async {
    try {
      return await _dataSource.getItemById(id);
    } catch (e) {
      throw Exception('Failed to get item: $e');
    }
  }

  @override
  Future<void> addItem(Item item) async {
    try {
      await _dataSource.addItem(item);
    } catch (e) {
      throw Exception('Failed to add item: $e');
    }
  }

  @override
  Future<void> updateItem(Item item) async {
    try {
      await _dataSource.updateItem(item);
    } catch (e) {
      throw Exception('Failed to update item: $e');
    }
  }

  @override
  Future<void> deleteItem(String id) async {
    try {
      await _dataSource.deleteItem(id);
    } catch (e) {
      throw Exception('Failed to delete item: $e');
    }
  }
}
