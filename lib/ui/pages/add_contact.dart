
import 'package:contacts/bloc/cubits/add_contact_cubit.dart';
import 'package:contacts/bloc/cubits/home_cubit.dart';
import 'package:contacts/bloc/states/add_contact_state.dart';
import 'package:contacts/ui/sizes.dart';
import 'package:contacts/utils/form_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddContact extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AddContactState();
  }

}

class _AddContactState extends State<AddContact>{

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _mailController = TextEditingController();
  var isM = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agrega un Contacto"),
        centerTitle: true,
      ),
      body: BlocListener(
        cubit: BlocProvider.of<AddContactCubit>(context),
        listener: (context, state){
          if(state is AddContactLoadSuccess){
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('Listo!'),
              ),
            );
            _nameController.clear();
            _addressController.clear();
            _phoneController.clear();
            _mailController.clear();
            setState(() => isM = true);
            BlocProvider.of<HomeCubit>(context).loadContacts();
          }else if(state is AddContactLoadFailure){
            // implement
          }
        },
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints){
              return Padding(
                padding: const EdgeInsets.all(paddingAll),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(paddingAll),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(bottom: paddingFormBottom),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Nombre"),
                                          TextFormField(
                                            controller: _nameController,
                                            validator: (value) => validateString(value, RegExp(r'\w*[a-zA-Z]\w*'), "Este campo es requerido"),
                                          ),
                                        ],
                                      )
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(bottom: paddingFormBottom),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Dirección"),
                                          TextFormField(
                                            controller: _addressController,
                                            validator: (value) => validateString(value, RegExp(r'\w*[a-zA-Z]\w*'), "Este campo es requerido"),
                                          ),
                                        ],
                                      )
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(bottom: paddingFormBottom),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Telefono"),
                                          TextFormField(
                                            controller: _phoneController,
                                            validator: (value) => validateString(value, RegExp(r'^\d{10}$'), "Este campo es requerido"),
                                            keyboardType: TextInputType.phone,
                                          ),
                                        ],
                                      )
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(bottom: paddingFormBottom),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Correo Electrónico"),
                                          TextFormField(
                                            controller: _mailController,
                                            validator: (value) => validateString(value, RegExp(r'^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$'), "Este campo es requerido"),
                                            keyboardType: TextInputType.emailAddress,
                                          ),
                                        ],
                                      )
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: ToggleButtons(
                                      borderColor: Theme.of(context).primaryColor,
                                      borderWidth: 3,
                                      selectedBorderColor: Theme.of(context).accentColor,
                                      splashColor: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(3),
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text("Masculino"),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text("Femenino"),
                                        )
                                      ],
                                      onPressed: (int index) {
                                        setState(() => isM = !isM);
                                      },
                                      isSelected: [isM, !isM],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        RaisedButton(
                          child: Text("Guardar"),
                          onPressed: (){
                            if (_formKey.currentState.validate()) {
                              BlocProvider.of<AddContactCubit>(context).insertContact(
                                  name: _nameController.text,
                                  address: _addressController.text,
                                  phone: _phoneController.text,
                                  mail: _mailController.text,
                                  sex: isM ? "Masculino" : "Femenino");
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}