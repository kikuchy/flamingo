import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

import '../document.dart';
import 'query_snapshot.dart';

class Query<T extends Document<T>> {
  Query(this.builder, this.query)
      : assert(builder != null),
        assert(query != null);

  final DocumentBuilder<T> builder;
  final firestore.Query query;

  Future<QuerySnapshot<T>> getDocuments({firestore.Source source}) {
    return query.getDocuments(source: source).then((snapshot) => QuerySnapshot(
          builder: builder,
          snapshot: snapshot,
        ));
  }

  Query<T> limit(int length) {
    return Query(builder, query.limit(length));
  }

  Query<T> orderBy(dynamic field, {bool descending: false}) {
    return Query(builder, query.orderBy(field, descending: descending));
  }

  Stream<QuerySnapshot<T>> snapshots({bool includeMetadataChanges: false}) {
    return query
        .snapshots(includeMetadataChanges: includeMetadataChanges)
        .map((snapshot) => QuerySnapshot(builder: builder, snapshot: snapshot));
  }

  Query<T> startAfterDocument(Document<T> document) {
    assert(document.snapshot != null);
    return Query(builder, query.startAfterDocument(document.snapshot));
  }

  Query<T> startAtDocument(Document<T> document) {
    assert(document.snapshot != null);
    return Query(builder, query.startAtDocument(document.snapshot));
  }

  Query<T> where(
    dynamic field, {
    dynamic isEqualTo,
    dynamic isLessThan,
    dynamic isLessThanOrEqualTo,
    dynamic isGreaterThan,
    dynamic isGreaterThanOrEqualTo,
    dynamic arrayContains,
    List<dynamic> arrayContainsAny,
    List<dynamic> whereIn,
    bool isNull,
  }) {
    return Query(
        builder,
        query.where(
          field,
          isEqualTo: isEqualTo,
          isLessThan: isLessThan,
          isLessThanOrEqualTo: isLessThanOrEqualTo,
          isGreaterThan: isGreaterThan,
          isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
          arrayContains: arrayContains,
          arrayContainsAny: arrayContainsAny,
          whereIn: whereIn,
          isNull: isNull,
        ));
  }
}
