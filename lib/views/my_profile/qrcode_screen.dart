import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_inventory_share/providers/auth_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrcodeScreen extends ConsumerWidget {
  const QrcodeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return Center(
      child: QrImageView(
        data: authState.user!.userId,
        version: QrVersions.auto,
        size: 300.0,
      ),
    );
  }
}
