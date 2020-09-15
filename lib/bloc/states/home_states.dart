
import 'package:contacts/model/contact.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeLoadInProgress extends HomeState {}

class HomeLoadSuccess extends HomeState {
  final List<Contact> contacts;

  const HomeLoadSuccess([this.contacts = const []]);

  @override
  List<Object> get props => [contacts];

  @override
  String toString() => 'HomeLoadSuccess { contacts: $contacts }';
}

class HomeLoadFailure extends HomeState {}