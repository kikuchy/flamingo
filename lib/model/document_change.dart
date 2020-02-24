import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:flutter/foundation.dart';

import '../document.dart';

class DocumentChange<T extends Document<T>> {
  DocumentChange({
    @required this.builder,
    @required this.change,
  })  : assert(builder != null),
        assert(change != null);

  final DocumentBuilder<T> builder;
  final firestore.DocumentChange change;

  T get document => builder(null, change.document, null);

  int get newIndex => change.newIndex;

  int get oldIndex => change.oldIndex;

  firestore.DocumentChangeType get type => change.type;
}
