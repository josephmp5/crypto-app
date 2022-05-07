import 'dart:io';
import 'package:emmi/models/user.dart' as model;
import 'package:emmi/constants.dart';
import 'package:emmi/ui/screen/crypto_home_page.dart';
import 'package:emmi/ui/screen/home_screen.dart';
import 'package:emmi/ui/screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
static AuthController instance = Get.find();

 late Rx<User?> _user;
 late Rx<File?> _pickedImage;

  File? get profilePhoto => _pickedImage.value;
  User get user => _user.value!;

  @override

 void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }


    void registerUser(
      String username, String email, String password) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty
          ) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        
        model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
          'Error Creating An Account',
          'Please fill all things',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating An Account',
        e.toString(),
      );
    }
  }



void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        print('log successful');
      } else {
        Get.snackbar(
          'Error Creating An Account',
          'Please fill all things',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating An Account',
        e.toString(),
      );
    }
  }

  void signOut() async {
    try{
      firebaseAuth.signOut();

    }catch(e) {
      print(e);
    }
  }

}