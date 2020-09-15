// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:sqflite/sqflite.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../bloc/cubits/add_contact_cubit.dart';
import '../provider/contact_provider.dart';
import '../repository/contact_repository.dart';
import '../bloc/cubits/home_cubit.dart';
import '../provider/sqflite_client/sqflite_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final sqfliteModule = _$SqfliteModule();
  gh.factory<ContactProvider>(() => ContactProvider(get<Database>()));
  gh.factory<ContactRepository>(
      () => ContactRepository(get<ContactProvider>()));
  gh.factory<HomeCubit>(() => HomeCubit(get<ContactRepository>()));
  gh.factory<AddContactCubit>(() => AddContactCubit(get<ContactRepository>()));

  // Eager singletons must be registered in the right order
  gh.singletonAsync<Database>(() => sqfliteModule.database());
  return get;
}

class _$SqfliteModule extends SqfliteModule {}
