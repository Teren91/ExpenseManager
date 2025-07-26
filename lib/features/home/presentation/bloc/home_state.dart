part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.income = 0.0,
    this.expense = 0.0,
    this.balance = 0.0,
    this.categoryExpenses = const [],
    this.message = '',
  });
  final HomeStatus status;
  final double income;
  final double expense;
  final double balance;
  final List<CategoryExpense> categoryExpenses;
  final String message;

  HomeState copyWith({
    HomeStatus? status,
    double? income,
    double? expense,
    double? balance,
    List<CategoryExpense>? categoryExpenses,
    String? message,
  }) {
    return HomeState(
      status: status ?? this.status,
      income: income ?? this.income,
      expense: expense ?? this.expense,
      balance: balance ?? this.balance,
      categoryExpenses: categoryExpenses ?? this.categoryExpenses,
      message: message ?? this.message,
    );
  }
  
  @override
  List<Object> get props => [status, income, expense, balance, categoryExpenses, message];
}
