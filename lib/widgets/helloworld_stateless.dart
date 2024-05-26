// Use ConsumerWidgets to build your UI when you have complex UI within your widget
// that can't be broken out into separate Consumerwidgets. This allows for targeted
// widget rebuilds when the state changes rather than the entire build() method.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing_shell_ex/providers/helloworld_provider.dart';

class HelloWorldConsumerBuildWidget extends StatelessWidget {
  const HelloWorldConsumerBuildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final helloWorld = ref.watch(helloWorldProvider);
        return Text(helloWorld);
      },
    );
  }
}
