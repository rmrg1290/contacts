
import 'package:contacts/bloc/states/home_states.dart';
import 'package:contacts/repository/contact_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState>{

  final ContactRepository contactRepository;

  HomeCubit(this.contactRepository): super(HomeLoadInProgress());

  loadContacts() async {
    var contacts = await contactRepository.getContacts();
    emit(HomeLoadSuccess(contacts));
  }

}