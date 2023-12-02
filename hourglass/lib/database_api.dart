import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'globals.dart';

void test_add() {
    final study_sess = <String, dynamic>{
        "tag": "reading",
        "amount": 75
    };
    db.collection("study-records").add(study_sess).then((DocumentReference doc) => print('Document snapshot added with id: ${doc.id}'));
}
