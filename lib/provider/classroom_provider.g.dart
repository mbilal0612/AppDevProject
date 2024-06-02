// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllClassroomsHash() => r'6333516f906dec0fa2c8de30fc82be466154fa6e';

/// See also [getAllClassrooms].
@ProviderFor(getAllClassrooms)
final getAllClassroomsProvider =
    AutoDisposeFutureProvider<List<ClassroomModel>>.internal(
  getAllClassrooms,
  name: r'getAllClassroomsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllClassroomsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllClassroomsRef
    = AutoDisposeFutureProviderRef<List<ClassroomModel>>;
String _$removeChildFromWaitListHash() =>
    r'1375a2a06410ac37728b2c9cfff1a93c6a4fb2e1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [removeChildFromWaitList].
@ProviderFor(removeChildFromWaitList)
const removeChildFromWaitListProvider = RemoveChildFromWaitListFamily();

/// See also [removeChildFromWaitList].
class RemoveChildFromWaitListFamily extends Family<AsyncValue<void>> {
  /// See also [removeChildFromWaitList].
  const RemoveChildFromWaitListFamily();

  /// See also [removeChildFromWaitList].
  RemoveChildFromWaitListProvider call(
    String uuid,
    String classroom,
  ) {
    return RemoveChildFromWaitListProvider(
      uuid,
      classroom,
    );
  }

  @override
  RemoveChildFromWaitListProvider getProviderOverride(
    covariant RemoveChildFromWaitListProvider provider,
  ) {
    return call(
      provider.uuid,
      provider.classroom,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'removeChildFromWaitListProvider';
}

/// See also [removeChildFromWaitList].
class RemoveChildFromWaitListProvider extends AutoDisposeFutureProvider<void> {
  /// See also [removeChildFromWaitList].
  RemoveChildFromWaitListProvider(
    String uuid,
    String classroom,
  ) : this._internal(
          (ref) => removeChildFromWaitList(
            ref as RemoveChildFromWaitListRef,
            uuid,
            classroom,
          ),
          from: removeChildFromWaitListProvider,
          name: r'removeChildFromWaitListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeChildFromWaitListHash,
          dependencies: RemoveChildFromWaitListFamily._dependencies,
          allTransitiveDependencies:
              RemoveChildFromWaitListFamily._allTransitiveDependencies,
          uuid: uuid,
          classroom: classroom,
        );

  RemoveChildFromWaitListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uuid,
    required this.classroom,
  }) : super.internal();

  final String uuid;
  final String classroom;

  @override
  Override overrideWith(
    FutureOr<void> Function(RemoveChildFromWaitListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemoveChildFromWaitListProvider._internal(
        (ref) => create(ref as RemoveChildFromWaitListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uuid: uuid,
        classroom: classroom,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RemoveChildFromWaitListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveChildFromWaitListProvider &&
        other.uuid == uuid &&
        other.classroom == classroom;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);
    hash = _SystemHash.combine(hash, classroom.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemoveChildFromWaitListRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `uuid` of this provider.
  String get uuid;

  /// The parameter `classroom` of this provider.
  String get classroom;
}

class _RemoveChildFromWaitListProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with RemoveChildFromWaitListRef {
  _RemoveChildFromWaitListProviderElement(super.provider);

  @override
  String get uuid => (origin as RemoveChildFromWaitListProvider).uuid;
  @override
  String get classroom => (origin as RemoveChildFromWaitListProvider).classroom;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
