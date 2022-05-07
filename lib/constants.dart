

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emmi/constants/auth_controller.dart';
import 'package:emmi/ui/screen/crypto_home_page.dart';
import 'package:emmi/ui/screen/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';



const backgroundColor = Colors.white;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

var authController = AuthController.instance;

