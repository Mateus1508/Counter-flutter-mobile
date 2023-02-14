import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent.shade700,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isFull ? 'Lotado' : 'Pode entrar',
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
              fontWeight: isFull ? FontWeight.w800 : FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w600,
                color: isFull ? Colors.red.shade900 : Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: isEmpty ? null : decrement,
                style: TextButton.styleFrom(
                    foregroundColor: Colors.purpleAccent,
                    backgroundColor: isEmpty ? Colors.white70 : Colors.white,
                    fixedSize: const Size(100, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'Saiu',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
              const SizedBox(width: 32),
              TextButton(
                onPressed: isFull ? null : increment,
                style: TextButton.styleFrom(
                    foregroundColor: Colors.purpleAccent,
                    backgroundColor: isFull ? Colors.white70 : Colors.white,
                    fixedSize: const Size(100, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'Entrou',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
