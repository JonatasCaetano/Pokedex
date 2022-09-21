import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex/models/entities/user_entity.dart';
import 'package:pokedex/models/entities/pokemon.dart';
import 'package:pokedex/repositories/interfaces/account_repository.dart';

class AccountFirebaseRepository extends AccountRepository {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserEntity> createAccount(
      {required String name,
      required String email,
      required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserEntity user = UserEntity(
        id: userCredential.user!.uid,
        name: name,
        email: userCredential.user!.email!,
      );
      await firebaseFirestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(user.toMap());
      print(user);
      return user;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<UserEntity> userIsLoggedIn() async {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      DocumentSnapshot documentSnapshot =
          await firebaseFirestore.collection('users').doc(user.uid).get();

      Map<String, dynamic> map =
          documentSnapshot.data() as Map<String, dynamic>;

      UserEntity userEntity = UserEntity.fromMap(map);
      print(userEntity);
      return userEntity;
    } else {
      throw Exception();
    }
  }

  @override
  Future<UserEntity> logIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      DocumentSnapshot documentSnapshot = await firebaseFirestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      Map<String, dynamic> map =
          documentSnapshot.data() as Map<String, dynamic>;
      UserEntity userEntity = UserEntity.fromMap(map);
      print(userEntity);
      return userEntity;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> logOut() async {
    firebaseAuth.signOut();
  }

  @override
  Future<List<Pokemon>> getPokemonsFavorite() async {
    List<Pokemon> pokemons = [];
    try {
      User? user = firebaseAuth.currentUser;
      if (user == null) {
        throw Exception();
      }
      final queryDocumentSnapshot = await firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .collection('favorites')
          .get();
      for (DocumentSnapshot documentSnapshot in queryDocumentSnapshot.docs) {
        Pokemon pokemon =
            Pokemon.fromMap(documentSnapshot.data() as Map<String, dynamic>);
        pokemons.add(pokemon);
      }
      return pokemons;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> checkIfPokemonIsFavorite({required Pokemon pokemon}) async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user == null) {
        return false;
      }
      DocumentSnapshot documentSnapshot = await firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .collection('favorites')
          .doc(pokemon.id)
          .get();
      if (documentSnapshot.exists) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> savePokemonFavorite({required Pokemon pokemon}) async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user == null) {
        throw Exception();
      }
      await firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .collection('favorites')
          .doc(pokemon.id)
          .set(pokemon.toMap());
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> removePokemonFavorite({required Pokemon pokemon}) async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user == null) {
        throw Exception();
      }
      DocumentSnapshot documentSnapshot = await firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .collection('favorites')
          .doc(pokemon.id)
          .get();
      if (documentSnapshot.exists) {
        firebaseFirestore
            .collection('users')
            .doc(user.uid)
            .collection('favorites')
            .doc(pokemon.id)
            .delete();
      }
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> savePokemonRecentlySeen({required Pokemon pokemon}) async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user == null) {
        throw Exception();
      }
      await firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .collection('recently')
          .doc(pokemon.id)
          .set(pokemon.toMap());
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Pokemon>> getPokemonsRecentlySeen() async {
    List<Pokemon> pokemons = [];
    try {
      User? user = firebaseAuth.currentUser;
      if (user == null) {
        throw Exception();
      }
      final queryDocumentSnapshot = await firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .collection('recently')
          .get();
      for (DocumentSnapshot documentSnapshot in queryDocumentSnapshot.docs) {
        Pokemon pokemon =
            Pokemon.fromMap(documentSnapshot.data() as Map<String, dynamic>);
        pokemons.add(pokemon);
      }
      return pokemons;
    } catch (e) {
      throw Exception();
    }
  }
}
