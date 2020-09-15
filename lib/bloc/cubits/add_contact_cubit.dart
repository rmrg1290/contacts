
import 'package:contacts/bloc/states/add_contact_state.dart';
import 'package:contacts/model/contact.dart';
import 'package:contacts/repository/contact_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@injectable
class AddContactCubit extends Cubit<AddContactState>{

  final ContactRepository contactRepository;

  AddContactCubit(this.contactRepository) : super(AddContactLoaded());

  insertContact({@required String name, @required String address, @required String phone, @required String mail, @required String sex}) async{
    var contact = Contact(name, address, phone, mail, sex);

    await contactRepository.insertContact(contact);

    emit(AddContactLoadSuccess());
  }

}