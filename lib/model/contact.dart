
class Contact{
  final int id;
  final String name;
  final String address;
  final String phone;
  final String mail;
  final String sex;

  Contact(this.name, this.address, this.phone, this.mail, this.sex, [this.id]);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'mail': mail,
      'sex': sex,
    };
  }
}