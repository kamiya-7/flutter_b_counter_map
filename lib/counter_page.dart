import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_development/bloc.dart';
import 'package:flutter_development/state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('COUNTER')),
      body: BlocBuilder<CounterBloc, CounterState>(
        buildWhen: (previous, current) => previous.count != current.count,
        builder: (context, state) => Center(
          child: Text(
            '${state.count}',
            style: const TextStyle(fontSize: 30.0),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(child: const Icon(Icons.add), onPressed: () => context.read<CounterBloc>().add(CounterEvent.increment)),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          FloatingActionButton(child: const Icon(Icons.remove), onPressed: () => context.read<CounterBloc>().add(CounterEvent.decrement)),
        ],
      ),
    );
  }
}
