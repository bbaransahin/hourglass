import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'globals.dart';

void test_add() {
    /**
    This function is used for testing the connection between app
    and the Firebase as adding new items to a collection.
    **/
    final study_sess = <String, dynamic>{
        "tag": "reading",
        "amount": 75
    };
    db.collection("study-records").add(study_sess).then((DocumentReference doc) => print('Document snapshot added with id: ${doc.id}'));
}

void add_session(int minutes, String tag) {
    /**
    It adds a session record to study-sessions collection on Firebase

    Inputs: length of session in minutes, classifier tag for session
    Returns nothing
    **/
    final study_sess = <String, dynamic>{
        "tag": tag,
        "amount": minutes
    };
    db.collection("study-records").add(study_sess).then((DocumentReference doc) => print('Study session added with id: ${doc.id}'));
}
