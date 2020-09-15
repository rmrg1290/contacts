
import 'package:contacts/model/contact.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@injectable
class ContactProvider{

  final Database database;

  ContactProvider(this.database);

  Future<List<Contact>> getContacts()async{

//    var contact = Contact(
//      "Marcelo Ramirez",
//      "E. Hubble 106",
//      "8114817703",
//      "rm.rg1290@gmail.com",
//      "masculino"
//    );
//
//    await database.insert(
//      'contact',
//      contact.toMap(),
//      conflictAlgorithm: ConflictAlgorithm.replace,
//    );

    final List<Map<String, dynamic>> maps = await database.query('contact');

    return List.generate(maps.length, (i) {
      return Contact(maps[i]['name'], maps[i]['address'], maps[i]['phone'], maps[i]['mail'], maps[i]['sex'], maps[i]['id']);
    });
  }

  Future<void> insertContact(Contact contact)async{
    await database.insert(
      'contact',
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}