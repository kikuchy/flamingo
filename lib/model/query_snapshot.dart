import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:flutter/foundation.dart';

import '../document.dart';
import 'document_change.dart';

class QuerySnapshot<T extends Document<T>> {
  QuerySnapshot({
    @required this.builder,
    @required this.snapshot,
  })  : assert(builder != null),
        assert(snapshot != null);

  final DocumentBuilder<T> builder;
  final firestore.QuerySnapshot snapshot;

  List<T> get documents =>
      snapshot.documents.map((d) => builder(null, d, null)).toList();

  List<DocumentChange<T>> get documentChanges => snapshot.documentChanges
      .map((c) => DocumentChange(builder: builder, change: c))
      .toList();

  firestore.SnapshotMetadata get metadata => snapshot.metadata;
}
