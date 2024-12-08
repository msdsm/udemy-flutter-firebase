import 'package:cloud_firestore/cloud_firestore.dart';

class Memo{
  String id;
  String title;
  String detail;
  Timestamp createdDate;
  Timestamp? updatedDate; // null許容

  Memo({
    required this.id,
    required this.title,
    required this.detail,
    required this.createdDate,
    this.updatedDate,
  });
}

/*
void test() {
  Memo newMemo = Memo(
    title: '新規メモ',
    detail: '買い出しに行く必要があります',
    createdDate: DateTime.now(),
  );
}
*/