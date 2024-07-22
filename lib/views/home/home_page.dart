import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_inventory_share/controllers/auth_controller.dart';
import 'package:home_inventory_share/providers/inventory_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider);
    final inventoryList = ref.watch(inventoryProvider);

    Future<void> logout() async {
      await authController.logout();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: CircleAvatar(
                  child: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () => context.push('/my-profile'),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: const Text(
                    'ログアウト',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  onTap: logout,
                ),
              ],
            ),
          ],
        ),
      ),
      body: inventoryList.isEmpty
          ? const Center(
              child: Text("生活用品を追加しよう"),
            )
          : ListView.builder(
              itemCount: inventoryList.length,
              itemBuilder: (context, index) {
                final inventory = inventoryList[index];
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(inventory.inventoryName),
                      Text('${inventory.inventoryQuantity}'),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/inventory/create'),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
