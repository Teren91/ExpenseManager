import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:misgastos/features/home/domain/entities/category_expense_entity.dart';


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
      const double expense = 500.0;
      const double balance = 500.0;
      final List<CategoryExpenseEntity> categoryExpenses = [
        const CategoryExpenseEntity(
          categoryName: 'Hogar', 
          amount: 400, 
          percentage: 90, 
          icon: Icons.home),
        const CategoryExpenseEntity(
          categoryName: 'Transporte', 
          amount: 100, 
          percentage: 10, 
          icon: Icons.directions_car),
      ];

      emit(state.copyWith(
        status: HomeStatus.success,
        income: income,
        expense: expense,
        balance: balance,
        categoryExpenses: categoryExpenses,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(status: HomeStatus.failure, message: e.toString()));
    }
  }
}
