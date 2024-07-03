import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_inventory_share/controllers/auth_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider);

    Future<void> logout() async {
      await authController.logout();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          const DrawerHeader(
            child: Center(
              child: Text('Home Inventory'),
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
          )
        ]),
      ),
    );
  }
}
