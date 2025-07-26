
import 'package:get_it/get_it.dart';
import 'package:misgastos/features/home/presentation/bloc/home_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<HomeBloc>(() => HomeBloc());
}