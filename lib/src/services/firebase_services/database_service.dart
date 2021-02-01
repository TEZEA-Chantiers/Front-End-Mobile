import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  FirebaseFirestore get firebaseFirestore => _firebaseFirestore;

  Stream<QuerySnapshot> getCollectionSnapshotStream(String collection) {
    return firebaseFirestore.collection(collection).snapshots();
  }

  Future<DocumentSnapshot> getDocument(String collection, String id) {
    return firebaseFirestore.collection(collection).doc(id).get();
  }

  CollectionReference getCollectionReference(String collection) {
    return firebaseFirestore.collection(collection);
  }
}
