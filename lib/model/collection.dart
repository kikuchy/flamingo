import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:flamingo/model/query.dart';

import '../document.dart';

class Collection<T extends Document<T>> extends Query<T> {
  Collection(T parent, this.name, DocumentBuilder<T> builder)
      : assert(parent != null),
        ref = parent.reference.collection(name),
        super(builder, parent.reference.collection(name));

  final firestore.CollectionReference ref;
  final String name;

  String get path => ref.path;
}
