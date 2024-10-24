// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_name.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$repositoryHash() => r'f37c9b204f997b3d3c2e909074bd99cddfab6257';

/// See also [repository].
@ProviderFor(repository)
final repositoryProvider = AutoDisposeProvider<TaskApiClient>.internal(
  repository,
  name: r'repositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$repositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RepositoryRef = AutoDisposeProviderRef<TaskApiClient>;
String _$listNotifierHash() => r'a15e2e049d431f21f60f3d5e1050f4e5f3da2cd3';

/// See also [ListNotifier].
@ProviderFor(ListNotifier)
final listNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ListNotifier, List<TaskList>>.internal(
  ListNotifier.new,
  name: r'listNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$listNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListNotifier = AutoDisposeAsyncNotifier<List<TaskList>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
