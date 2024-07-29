import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_inventory_share/providers/auth_provider.dart';

class MyProfile extends ConsumerWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(authState.user!.username),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 0.1,
                  )),
              child: ClipOval(
                child: Image.asset('images/default_profile.png'),
              ),
            ),
            Text('uid'),
            Text('toggle button to change qr code screen'),
          ],
        ),
      ),
    );
  }
}
