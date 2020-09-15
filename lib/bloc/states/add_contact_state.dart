import 'package:equatable/equatable.dart';

abstract class AddContactState extends Equatable {
  const AddContactState();
  @override
  List<Object> get props => [];
}

class AddContactLoaded extends AddContactState {}

class AddContactLoadInProgress extends AddContactState {}

class AddContactLoadSuccess extends AddContactState {}

class AddContactLoadFailure extends AddContactState {}