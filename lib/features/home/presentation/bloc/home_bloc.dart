import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:misgastos/features/home/domain/entities/category_expense.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeStarted>(_onHomeStarted);
  }

  Future<void> _onHomeStarted(
    HomeStarted event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState(status: HomeStatus.loading));
    try{
      await Future.delayed(const Duration(seconds: 1));

      //TODO: Obtener los datos de la base de datos
      const double income = 1000.0;
      const double expense = 400.0;
      const double balance = 600.0;

      emit(state.copyWith(
        status: HomeStatus.success,
        income: income,
        expense: expense,
        balance: balance,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(status: HomeStatus.failure, message: e.toString()));
    }
  }
}
