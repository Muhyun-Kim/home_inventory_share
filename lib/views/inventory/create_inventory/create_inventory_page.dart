import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateInventoryPage extends ConsumerStatefulWidget {
  const CreateInventoryPage({super.key});

  @override
  ConsumerState<CreateInventoryPage> createState() =>
      _CreateInventoryPageState();
}

class _CreateInventoryPageState extends ConsumerState<CreateInventoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('create inventory'),
      ),
    );
  }
}
