import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suitmedia_01/core/providers/user_provider.dart';
import 'package:suitmedia_01/core/routes/router.gr.dart';

@RoutePage()
class SecondPage extends ConsumerStatefulWidget {
  const SecondPage({super.key});

  @override
  ConsumerState createState() => _SecondPageState();
}

class _SecondPageState extends ConsumerState<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider) ?? '-';
    final selectedUser = ref.watch(selectedUserProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.withValues(alpha: 0.2),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors.blue,
          ),
          onPressed: () => AutoRouter.of(context).maybePop(),
        ),
        title: const Text(
          'Second Screen',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    user,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: Text(
                selectedUser != null
                    ? '${selectedUser.firstName} ${selectedUser.lastName}'
                    : 'Selected User Name',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 48,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const ThirdRoute());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(43, 99, 123, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Choose a User',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
