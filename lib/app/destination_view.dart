import 'package:flutter/material.dart';
import 'package:navigation_bar_example/app/root_page.dart';
import 'package:navigation_bar_example/app/sub_pages/text_page.dart';

import 'entities/destination.dart';
import 'sub_pages/list_page.dart';

class DestinationView extends StatefulWidget {
  const DestinationView({required this.destination, required this.navigatorKey, super.key});

  final Destination destination;
  final Key navigatorKey;

  @override
  State<DestinationView> createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case '/':
                return RootPage(destination: widget.destination);
              case '/list':
                return ListPage(destination: widget.destination);
              case '/text':
                return TextPage(destination: widget.destination);
            }
            assert(false, 'has no route to navigate');
            return const SizedBox();
          },
        );
      },
    );
  }
}
