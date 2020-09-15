
import 'package:contacts/model/contact.dart';
import 'package:contacts/provider/contact_provider.dart';
import 'package:injectable/injectable.dart';

@injectable
class ContactRepository{

  final ContactProvider contactProvider;

  ContactRepository(this.contactProvider);

  Future<List<Contact>> getContacts() async{
    return await contactProvider.getContacts();
  }

  Future<void> insertContact(Contact contact) async{
    return await contactProvider.insertContact(contact);
  }
}