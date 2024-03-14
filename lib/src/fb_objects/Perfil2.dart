import 'package:cloud_firestore/cloud_firestore.dart';

class Perfil2 {
  final String? name;
  final String? city;
  final String? country;
  final int? age;

  Perfil2({
    this.name ='',
    this.city ='',
    this.country ='',
    this.age =0,
  });

  factory Perfil2.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Perfil2(
      name: data?['name'],
      city: data?['city'],
      country: data?['country'],
      age: data?['age'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (city != null) "city": city,
      if (country != null) "country": country,
      if (age != 0) "age": age,
    };
  }
}