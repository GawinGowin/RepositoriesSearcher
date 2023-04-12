// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dataNotifierHash() => r'f772d0fcb5bef33f1c7abf6c78ffebe93ff5b6ff';

/// See also [DataNotifier].
@ProviderFor(DataNotifier)
final dataNotifierProvider =
    AutoDisposeAsyncNotifierProvider<DataNotifier, List<dynamic>>.internal(
  DataNotifier.new,
  name: r'dataNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dataNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DataNotifier = AutoDisposeAsyncNotifier<List<dynamic>>;
String _$repoCountNotifierHash() => r'3746dbd96041281e8bda5ed55dc9bd6a8925f727';

/// See also [RepoCountNotifier].
@ProviderFor(RepoCountNotifier)
final repoCountNotifierProvider =
    AutoDisposeNotifierProvider<RepoCountNotifier, int>.internal(
  RepoCountNotifier.new,
  name: r'repoCountNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repoCountNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RepoCountNotifier = AutoDisposeNotifier<int>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
