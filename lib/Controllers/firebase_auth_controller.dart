import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FirebaseAuthController extends GetxController {
  final FirebaseAuth _firebase = FirebaseAuth.instance;

  final Rx<User?> _user = FirebaseAuth.instance.currentUser.obs;

  User? get user => _user.value;

  final getstorage = GetStorage();

  bool isFirstTime = true;

  @override
  void onInit() {
    _user.bindStream(_firebase.authStateChanges());
    getstorage.writeIfNull('isFirstTime', true);
    // getstorage.write('isFirstTime', true);
    isFirstTime = getstorage.read('isFirstTime');
    super.onInit();
  }

  Future<void> createuser(
      {required String email, required String password}) async {
    try {
      await _firebase.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString(), duration: 2.seconds);
    }
  }

  Future<void> loginuser(
      {required String email, required String password}) async {
    try {
      await _firebase.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString(), duration: 2.seconds);
    }
  }

  Future<void> logout() async {
    try {
      _firebase.signOut();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString(), duration: 2.seconds);
    }
  }

  Future<void> forgotpassword({required String email}) async {
    try {
      _firebase.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
    }
  }
}
