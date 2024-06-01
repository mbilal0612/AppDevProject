// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getChildrenInClassroomHash() =>
    r'3a590eb6bedec53e332a1a96e35c323d7c18aa0a';

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

/// See also [getChildrenByParentEmail].
@ProviderFor(getChildrenByParentEmail)
const getChildrenInClassroomProvider = GetChildrenInClassroomFamily();

/// See also [getChildrenByParentEmail].
class GetChildrenInClassroomFamily
    extends Family<AsyncValue<List<ChildModel>>> {
  /// See also [getChildrenByParentEmail].
  const GetChildrenInClassroomFamily();

  /// See also [getChildrenByParentEmail].
  GetChildrenInClassroomProvider call(
    String classroom,
  ) {
    return GetChildrenInClassroomProvider(
      classroom,
    );
  }

  @override
  GetChildrenInClassroomProvider getProviderOverride(
    covariant GetChildrenInClassroomProvider provider,
  ) {
    return call(
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
  String? get name => r'getChildrenInClassroomProvider';
}

/// See also [getChildrenByParentEmail].
class GetChildrenInClassroomProvider
    extends AutoDisposeFutureProvider<List<ChildModel>> {
  /// See also [getChildrenByParentEmail].
  GetChildrenInClassroomProvider(
    String classroom,
  ) : this._internal(
          (ref) => getChildrenByParentEmail(
            ref as GetChildrenInClassroomRef,
            classroom,
          ),
          from: getChildrenInClassroomProvider,
          name: r'getChildrenInClassroomProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getChildrenInClassroomHash,
          dependencies: GetChildrenInClassroomFamily._dependencies,
          allTransitiveDependencies:
              GetChildrenInClassroomFamily._allTransitiveDependencies,
          classroom: classroom,
        );

  GetChildrenInClassroomProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.classroom,
  }) : super.internal();

  final String classroom;

  @override
  Override overrideWith(
    FutureOr<List<ChildModel>> Function(GetChildrenInClassroomRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetChildrenInClassroomProvider._internal(
        (ref) => create(ref as GetChildrenInClassroomRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        classroom: classroom,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ChildModel>> createElement() {
    return _GetChildrenInClassroomProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetChildrenInClassroomProvider &&
        other.classroom == classroom;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, classroom.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetChildrenInClassroomRef
    on AutoDisposeFutureProviderRef<List<ChildModel>> {
  /// The parameter `classroom` of this provider.
  String get classroom;
}

class _GetChildrenInClassroomProviderElement
    extends AutoDisposeFutureProviderElement<List<ChildModel>>
    with GetChildrenInClassroomRef {
  _GetChildrenInClassroomProviderElement(super.provider);

  @override
  String get classroom => (origin as GetChildrenInClassroomProvider).classroom;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
