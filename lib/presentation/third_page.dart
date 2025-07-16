import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:suitmedia_01/components/list_card.dart';
import 'package:suitmedia_01/components/base_shimmer.dart';
import 'package:suitmedia_01/core/providers/user_provider.dart';
import 'package:suitmedia_01/data/models/user_model.dart';

@RoutePage()
class ThirdPage extends ConsumerStatefulWidget {
  const ThirdPage({super.key});

  @override
  ConsumerState<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends ConsumerState<ThirdPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final provider = ref.read(paginatedUserProvider.notifier);
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        provider.fetchMoreUsers();
      }
    });
  }

  void _selectUser(BuildContext context, WidgetRef ref, UserModel user) {
    ref.read(selectedUserProvider.notifier).state = user;
    AutoRouter.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(paginatedUserProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.withValues(alpha: 0.2),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.blue),
          onPressed: () => AutoRouter.of(context).maybePop(),
        ),
        title: const Text(
          'Third Screen',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: usersAsync.when(
        loading: () => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: 8,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (_, __) => const UserShimmerItem(),
        ),
        error: (err, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Failed to load users'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(paginatedUserProvider.notifier).refresh(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (users) => RefreshIndicator(
          onRefresh: () => ref.read(paginatedUserProvider.notifier).refresh(),
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            itemCount: users.length,
            separatorBuilder: (_, __) => const Divider(
              height: 1,
              thickness: 0.5,
              indent: 16,
              endIndent: 16,
              color: Color(0xFFEEEEEE),
            ),
            itemBuilder: (_, index) {
              final user = users[index];
              return MahaChatListCard(
                onTap: () => _selectUser(context, ref, user),
                name: '${user.firstName} ${user.lastName}',
                subtitle: user.email,
                image: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
