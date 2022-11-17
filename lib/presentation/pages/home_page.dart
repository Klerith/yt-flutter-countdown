import 'package:flutter/material.dart';

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
    
    return Scaffold(
      /// Título de la página
      appBar: AppBar(
        title: const Text('Cuenta regresiva'),
        actions: [
          IconButton(
              onPressed: () {
                ///TODO Reiniciar el timer
              },
              icon: const Icon(Icons.restart_alt_outlined))
        ],
      ),

      /// Contador
      body: const _CounterLabel(),

      /// Play - Stop
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ///TODO Iniciar o detener el temporizador
        },
        child: const Icon( Icons.play_arrow_outlined ),
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
        children: const [
          Icon(Icons.timer_outlined, color: Colors.blue, size: 60),
          SizedBox(width: 10),
          Text(
            '00:30',
            style: TextStyle(fontSize: 50),
          ),
        ],
      ),
    );
  }
}
