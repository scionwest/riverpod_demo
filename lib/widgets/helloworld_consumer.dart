import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing_shell_ex/providers/helloworld_provider.dart';

class HelloWorldConsumerStatelessWidget extends ConsumerWidget {
  const HelloWorldConsumerStatelessWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloWorld = ref.watch(helloWorldProvider);
    return Text(helloWorld);
  }
}
