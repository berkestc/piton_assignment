import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String token;
  final int id;

  const User({required this.token, required this.id});

  @override
  List<Object?> get props => [token];
}
