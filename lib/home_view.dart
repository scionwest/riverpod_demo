import 'package:flutter/material.dart';
import 'package:routing_shell_ex/widgets/helloworld_stateful.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelloWorldConsumerStatefulWidget();
  }
}
