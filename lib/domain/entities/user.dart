import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String password;
  User({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
