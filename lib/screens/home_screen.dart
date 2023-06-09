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
            //////////////////////BlocConsumer//////////////////////////

            //The BlocConsumer widget is responsible for two main tasks:
            //1- Listening to the state changes and 2- Reacting to state changes

            //////builder: The builder callback is responsible for building the UI based on
            ///// the current state emitted by the BLoC. It receives the BuildContext and the
            /////state as input parameters and returns the widget tree to be rendered.
            ///
            ///listener: The listener callback is executed whenever a new state is emitted by the BLoC.
            /// It allows you to perform side effects or trigger actions based on the state changes.
            ///  For example, you can show a SnackBar, navigate to a different screen, or perform any other
            /// logic based on the new state.

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
                  //The line of code, context.read<CounterBloc>().add(DecrementEvent())  is responsible for
                  //triggering the CounterBloc to handle a DecrementEvent. This event will initiate the
                  //necessary logic in the CounterBloc to decrement the counter value and emit a new state.
                  //The UI will then be updated based on the new state emitted by the CounterBloc.
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
