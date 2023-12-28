import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodVichet/routes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      title: 'Flutter Demo',
    );
  }
}

final counterProvider = StateProvider((ref) => 0);
void onAdd(ref) {
  ref.read(counterProvider.notifier).state++;
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Riverpod",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            onAdd(ref);
          },
          child: Text(
            count.toString(),
          ),
        ),
      ),
    );
  }
}
