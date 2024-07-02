import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_inventory_share/controllers/auth_controller.dart';

class CreateAccountPage extends ConsumerStatefulWidget {
  const CreateAccountPage({super.key});

  @override
  ConsumerState<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends ConsumerState<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  String? _usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'ユーザー名を入力してください';
    }
    if (value.length < 3 || value.length > 12) {
      return 'ユーザー名は3文字以上12文字以下にしてください';
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'メールアドレスを入力してください';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return '有効なメールアドレスを記入してください';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワードを入力してください';
    }
    if (value.length < 8) {
      return 'パスワードは8文字以上';
    }
    if (RegExp(r'[^a-zA-Z0-9!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'パスワードに使えない文字が入っています';
    }
    return null;
  }

  String? _passwordConfirmValidator(String? value) {
    if (value != _passwordController.text) {
      return 'パスワードと一致していません';
    }
    return null;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final authController = ref.read(authControllerProvider);
      try {
        authController.createAccountWithEmail(
          email: _emailController.text,
          password: _passwordController.text,
          username: _usernameController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('アカウントを作成しました'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('アカウントの作成に失敗しました'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.00),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'ユーザー名',
                ),
                validator: _usernameValidator,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'メールアドレス',
                ),
                validator: _emailValidator,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'パスワード',
                ),
                validator: _passwordValidator,
                obscureText: true,
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'パスワード確認',
                ),
                validator: _passwordConfirmValidator,
                obscureText: true,
              ),
              const SizedBox(height: 16.00),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text(
                  'アカウント作成',
                ),
              ),
              ElevatedButton(
                onPressed: () => context.go('/login'),
                child: const Text('ログイン'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
