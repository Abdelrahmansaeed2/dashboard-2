import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user.dart' as app_user;

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  User? _firebaseUser;
  app_user.User? _user;
  bool _isLoading = false;

  User? get firebaseUser => _firebaseUser;
  app_user.User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _firebaseUser != null;

  AuthProvider() {
    _init();
  }

  void _init() {
    _auth.authStateChanges().listen((User? user) async {
      _firebaseUser = user;
      if (user != null) {
        await _fetchUserData();
      } else {
        _user = null;
      }
      notifyListeners();
    });
  }

  Future<void> _fetchUserData() async {
    if (_firebaseUser == null) return;
    
    try {
      final doc = await _firestore.collection('users').doc(_firebaseUser!.uid).get();
      if (doc.exists) {
        final data = doc.data()!;
        _user = app_user.User(
          id: _firebaseUser!.uid,
          name: data['name'] ?? '',
          avatarUrl: data['avatarUrl'] ?? 'https://via.placeholder.com/32',
        );
      }
    } catch (e) {
      debugPrint('Error fetching user data: $e');
    }
  }

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _fetchUserData();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signUp(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Create user profile in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'avatarUrl': 'https://via.placeholder.com/32',
        'createdAt': FieldValue.serverTimestamp(),
      });
      
      await _fetchUserData();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }

  Future<void> updateProfile({String? name, String? avatarUrl}) async {
    if (_firebaseUser == null) return;
    
    _isLoading = true;
    notifyListeners();

    try {
      final updates = <String, dynamic>{};
      if (name != null) updates['name'] = name;
      if (avatarUrl != null) updates['avatarUrl'] = avatarUrl;
      
      await _firestore.collection('users').doc(_firebaseUser!.uid).update(updates);
      await _fetchUserData();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
