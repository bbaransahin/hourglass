import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var db = FirebaseFirestore.instance;

final studyTimeController = TextEditingController();
final breakTimeController = TextEditingController();
