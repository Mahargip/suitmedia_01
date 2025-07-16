import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suitmedia_01/data/models/user_model.dart';
import 'package:suitmedia_01/data/repositories/user_repository.dart';

final userProvider = StateProvider<String?>((ref) => null);

final selectedUserProvider = StateProvider<UserModel?>((ref) => null);

final allUsersProvider = FutureProvider.autoDispose<List<UserModel>>((ref) async {
  final repo = ref.watch(userRepositoryProvider);
  return await repo.fetchUsers();
});


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

final paginatedUserProvider = StateNotifierProvider.autoDispose<
    PaginatedUserNotifier, AsyncValue<List<UserModel>>>((ref) {
  final repo = ref.watch(userRepositoryProvider);
  return PaginatedUserNotifier(repo);
});


class PaginatedUserNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  PaginatedUserNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchInitialUsers();
  }

  final UserRepository _repository;
  int _currentPage = 1;
  bool _isFetchingMore = false;
  bool _hasNextPage = true;

  List<UserModel> _users = [];

  Future<void> fetchInitialUsers() async {
    try {
      _currentPage = 1;
      final users = await _repository.fetchUsers(page: _currentPage);
      _users = users;
      _hasNextPage = users.length == 10;
      state = AsyncValue.data(users);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> fetchMoreUsers() async {
    if (_isFetchingMore || !_hasNextPage) return;
    _isFetchingMore = true;
    try {
      _currentPage++;
      final moreUsers = await _repository.fetchUsers(page: _currentPage);
      _users.addAll(moreUsers);
      _hasNextPage = moreUsers.length == 10;
      state = AsyncValue.data([..._users]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    } finally {
      _isFetchingMore = false;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    await fetchInitialUsers();
  }
}
