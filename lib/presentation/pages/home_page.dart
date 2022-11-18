import 'package:countdown_app/presentation/providers/countdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePageView();
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countdownProvider = Provider.of<CountdownProvider>(context);

    return Scaffold(
      /// Título de la página
      appBar: AppBar(
        title: const Text('Cuenta regresiva'),
        actions: [
          IconButton(
              onPressed: () {
                countdownProvider.setCountdownDuration(const Duration(seconds: 60));
              },
              icon: const Icon(Icons.restart_alt_outlined))
        ],
      ),

      /// Contador
      body: const _CounterLabel(),

      /// Play - Stop
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countdownProvider.startStopTimer();
        },
        child: Icon(countdownProvider.isRunning
            ? Icons.pause
            : Icons.play_arrow_outlined),
      ),
    );
  }
}

class _CounterLabel extends StatelessWidget {
  const _CounterLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.timer_outlined, color: Colors.blue, size: 60),
          const SizedBox(width: 10),
          Text(
            context.select(
                (CountdownProvider countdown) => countdown.timeLeftString),
            style: const TextStyle(fontSize: 50),
          ),
        ],
      ),
    );
  }
}
