import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flamingo/document_accessor.dart';
import 'package:flamingo/type/type.dart';
import '../document.dart';

class Collection<T extends Document<DocumentType>> {
  Collection(Document parent, this.name) {
    ref = parent.reference.collection(name);
    path = ref.path;
  }
  CollectionReference ref;
  String path;
  String name;

  Future<void> add(T document) async {
    final accessor = DocumentAccessor();
    await accessor.save(document);
  }
}
