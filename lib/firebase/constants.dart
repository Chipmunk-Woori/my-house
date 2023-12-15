import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_1/common/manager/storage_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_auth_manager.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseAuthManager firebaseManager = FirebaseAuthManager.instance;
FirebaseStorage firebaseStorage = FirebaseStorage.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
StorageManager storageManager = StorageManager();
