import 'package:flutter/material.dart';

import '../entities/destination.dart';

class ListPage extends StatelessWidget {
  const ListPage({required this.destination, super.key});

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    const int itemCount = 50;
    final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
      foregroundColor: destination.color,
      fixedSize: const Size.fromHeight(128),
      textStyle: Theme.of(context).textTheme.headlineSmall,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('${destination.title} ListPage - /list'),
        backgroundColor: destination.color,
      ),
      backgroundColor: destination.color[50],
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: OutlinedButton(
                style: buttonStyle.copyWith(
                  backgroundColor: MaterialStatePropertyAll<Color>(Color.lerp(destination.color[100], Colors.white, index / itemCount)!),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/text');
                },
                child: Text('Push /text [$index]'),
              ),
            );
          },
        ),
      ),
    );
  }
}
