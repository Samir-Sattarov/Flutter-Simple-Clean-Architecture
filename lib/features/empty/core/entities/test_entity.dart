import 'package:equatable/equatable.dart';

class TestEntity extends Equatable {
  final String title;

  const TestEntity({required this.title});

  @override
  List<Object?> get props => [title];
}
