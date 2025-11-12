import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:at_91_f/services/auth_service.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    final email = auth.currentUser?.email ?? 'Usuario';

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 36,
              child: Text(email.isNotEmpty ? email[0].toUpperCase() : 'U'),
            ),
            const SizedBox(height: 12),
            Text(email, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await auth.logout();
                if (context.mounted) GoRouter.of(context).go('/');
              },
              child: const Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
