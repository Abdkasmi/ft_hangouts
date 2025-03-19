import '../header.dart';

class Contact {
  final int? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String nickname;

  Contact({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.nickname,
  });

  // Convert a Contact to a Map (for SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'nickname': nickname,
    };
  }

  // Create a Contact from a Map (from SQLite)
  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      nickname: map['nickname'],
    );
  }
}