
import 'package:contacts/bloc/cubits/add_contact_cubit.dart';
import 'package:contacts/bloc/cubits/home_cubit.dart';
import 'package:contacts/bloc/states/home_states.dart';
import 'package:contacts/ui/pages/add_contact.dart';
import 'package:contacts/ui/sizes.dart';
import 'package:contacts/ui/widgets/empty_state.dart';
import 'package:contacts/ui/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }

}

class _HomeState extends State<Home>{

  HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = BlocProvider.of<HomeCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Contactos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<HomeCubit>.value(value: _homeCubit),
            BlocProvider<AddContactCubit>(
              create: (context) => GetIt.I<AddContactCubit>(),
            )
          ],
          child: AddContact(),
        ))),
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints){
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              padding: EdgeInsets.all(paddingAll),
              child: BlocBuilder(
                cubit: _homeCubit,
                builder: (context, state){
                  if(state is HomeLoadInProgress){
                    return Loader();
                  }else if(state is HomeLoadSuccess){
                    return state.contacts.length > 0 ? ListView.builder(
                      itemCount: state.contacts.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          leading: Icon(Icons.contact_mail),
                          title: Text(state.contacts[index].name),
                          subtitle: Text(state.contacts[index].phone),
                        );
                      },
                    ) : EmptyState(message: "Aún no tienes contactos", icon: Icon(Icons.android));
                  }
                  return Container();
                },
              ),
            );
          },
        ),
      )
    );
  }

}