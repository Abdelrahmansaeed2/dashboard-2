import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/item.dart';
import '../../domain/entities/user.dart';

abstract class ItemDataSource {
  Future<List<Item>> getItems();
  Future<Item> getItemById(String id);
  Future<void> addItem(Item item);
  Future<void> updateItem(Item item);
  Future<void> deleteItem(String id);
}

class FirestoreItemDataSource implements ItemDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Item>> getItems() async {
    final snapshot = await _firestore.collection('items').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return Item.fromJson(data);
    }).toList();
  }

  @override
  Future<Item> getItemById(String id) async {
    final doc = await _firestore.collection('items').doc(id).get();
    if (!doc.exists) {
      throw Exception('Item not found');
    }
    final data = doc.data()!;
    data['id'] = doc.id;
    return Item.fromJson(data);
  }

  @override
  Future<void> addItem(Item item) async {
    await _firestore.collection('items').add(item.toJson());
  }

  @override
  Future<void> updateItem(Item item) async {
    await _firestore.collection('items').doc(item.id).update(item.toJson());
  }

  @override
  Future<void> deleteItem(String id) async {
    await _firestore.collection('items').doc(id).delete();
  }
}
