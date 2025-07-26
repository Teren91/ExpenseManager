import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:misgastos/app/di/injection_container.dart';
import 'package:misgastos/features/home/presentation/bloc/home_bloc.dart';
import 'package:misgastos/features/home/presentation/widgets/summary_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(HomeStarted()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Gestor de Gastos')),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == HomeStatus.loading || state.status == HomeStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            }
            if(state.status == HomeStatus.failure) {
              return Center(
                child: Text('Error al cargar los datos', style: Theme.of(context).textTheme.titleLarge,),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    SummaryCard(title: 'Ingresos', amount: state.income, icon: Icons.arrow_upward, amountColor: Colors.green,),
                    SummaryCard(title: 'Gastos', amount: state.expense, icon: Icons.arrow_downward, amountColor: Colors.red,),
                    SummaryCard(
                      title: 'Balance',
                      amount: state.balance,
                      icon: Icons.arrow_upward,
                      amountColor: state.balance >= 0 ? Colors.green : Colors.red,
                    ),
                  ],
                )),
            );
          },
        ),
      ),
    );
  }
}
