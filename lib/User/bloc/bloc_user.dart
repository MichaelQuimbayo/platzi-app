import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();

  //flujo de datos:stream
  //Stream-firebase
  //StreamController
  Stream<User?>streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;


  //casos de uso
  //1. SignIn a la aplicaion google
  Future<UserCredential> SignIn(){
    return _auth_repository.signInFirebase();
  }

  signOut(){
    _auth_repository.signOut();
  }

  @override
  void dispose() {

  }
}