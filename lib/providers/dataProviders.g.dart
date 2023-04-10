// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataProviders.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dataNotifierHash() => r'd8edca32af03dca13be5d614f60920c90210e67d';

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
String _$responseNotifierHash() => r'c555790d3e9cf96bdf1b07995bb91f17fd545a6c';

/// See also [ResponseNotifier].
@ProviderFor(ResponseNotifier)
final responseNotifierProvider = AutoDisposeNotifierProvider<ResponseNotifier,
    Map<dynamic, dynamic>>.internal(
  ResponseNotifier.new,
  name: r'responseNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$responseNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ResponseNotifier = AutoDisposeNotifier<Map<dynamic, dynamic>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
