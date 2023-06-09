import 'package:flutter/material.dart';

import '../bloc/bloc_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isSnackBarShown = true;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state.counterValue == 3) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('successfully incremented'),
                    duration: Duration(milliseconds: 300),
                  ));
                } else if (state.counterValue < 0 && isSnackBarShown) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('negative numbers has initialized'),
                    duration: Duration(milliseconds: 300),
                  ));
                  isSnackBarShown = false;
                }
              },
              builder: (context, state) {
                return Text('Current Value: ${state.counterValue} ');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(DecrementEvent()),
                  child: const Text('Decrease -'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(IncrementEvent()),
                  child: const Text('Increase +'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
