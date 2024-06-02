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

/// See also [getChildrenInClassroom].
@ProviderFor(getChildrenInClassroom)
const getChildrenInClassroomProvider = GetChildrenInClassroomFamily();

/// See also [getChildrenInClassroom].
class GetChildrenInClassroomFamily
    extends Family<AsyncValue<List<ChildModel>>> {
  /// See also [getChildrenInClassroom].
  const GetChildrenInClassroomFamily();

  /// See also [getChildrenInClassroom].
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

/// See also [getChildrenInClassroom].
class GetChildrenInClassroomProvider
    extends AutoDisposeFutureProvider<List<ChildModel>> {
  /// See also [getChildrenInClassroom].
  GetChildrenInClassroomProvider(
    String classroom,
  ) : this._internal(
          (ref) => getChildrenInClassroom(
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

String _$getChildrenByParentEmailHash() =>
    r'e5a4dc6792509475069539dcf270ede10c542186';

/// See also [getChildrenByParentEmail].
@ProviderFor(getChildrenByParentEmail)
const getChildrenByParentEmailProvider = GetChildrenByParentEmailFamily();

/// See also [getChildrenByParentEmail].
class GetChildrenByParentEmailFamily
    extends Family<AsyncValue<List<ChildModel>>> {
  /// See also [getChildrenByParentEmail].
  const GetChildrenByParentEmailFamily();

  /// See also [getChildrenByParentEmail].
  GetChildrenByParentEmailProvider call(
    String email,
  ) {
    return GetChildrenByParentEmailProvider(
      email,
    );
  }

  @override
  GetChildrenByParentEmailProvider getProviderOverride(
    covariant GetChildrenByParentEmailProvider provider,
  ) {
    return call(
      provider.email,
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
  String? get name => r'getChildrenByParentEmailProvider';
}

/// See also [getChildrenByParentEmail].
class GetChildrenByParentEmailProvider
    extends AutoDisposeFutureProvider<List<ChildModel>> {
  /// See also [getChildrenByParentEmail].
  GetChildrenByParentEmailProvider(
    String email,
  ) : this._internal(
          (ref) => getChildrenByParentEmail(
            ref as GetChildrenByParentEmailRef,
            email,
          ),
          from: getChildrenByParentEmailProvider,
          name: r'getChildrenByParentEmailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getChildrenByParentEmailHash,
          dependencies: GetChildrenByParentEmailFamily._dependencies,
          allTransitiveDependencies:
              GetChildrenByParentEmailFamily._allTransitiveDependencies,
          email: email,
        );

  GetChildrenByParentEmailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String email;

  @override
  Override overrideWith(
    FutureOr<List<ChildModel>> Function(GetChildrenByParentEmailRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetChildrenByParentEmailProvider._internal(
        (ref) => create(ref as GetChildrenByParentEmailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ChildModel>> createElement() {
    return _GetChildrenByParentEmailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetChildrenByParentEmailProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetChildrenByParentEmailRef
    on AutoDisposeFutureProviderRef<List<ChildModel>> {
  /// The parameter `email` of this provider.
  String get email;
}

class _GetChildrenByParentEmailProviderElement
    extends AutoDisposeFutureProviderElement<List<ChildModel>>
    with GetChildrenByParentEmailRef {
  _GetChildrenByParentEmailProviderElement(super.provider);

  @override
  String get email => (origin as GetChildrenByParentEmailProvider).email;
}

String _$getNotWaitListedChildrenInClassHash() =>
    r'7282550a51e7cb1dda2f99ace6bdf29f287cb9a3';

/// See also [getNotWaitListedChildrenInClass].
@ProviderFor(getNotWaitListedChildrenInClass)
const getNotWaitListedChildrenInClassProvider =
    GetNotWaitListedChildrenInClassFamily();

/// See also [getNotWaitListedChildrenInClass].
class GetNotWaitListedChildrenInClassFamily
    extends Family<AsyncValue<List<ChildModel>>> {
  /// See also [getNotWaitListedChildrenInClass].
  const GetNotWaitListedChildrenInClassFamily();

  /// See also [getNotWaitListedChildrenInClass].
  GetNotWaitListedChildrenInClassProvider call(
    String classroom,
  ) {
    return GetNotWaitListedChildrenInClassProvider(
      classroom,
    );
  }

  @override
  GetNotWaitListedChildrenInClassProvider getProviderOverride(
    covariant GetNotWaitListedChildrenInClassProvider provider,
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
  String? get name => r'getNotWaitListedChildrenInClassProvider';
}

/// See also [getNotWaitListedChildrenInClass].
class GetNotWaitListedChildrenInClassProvider
    extends AutoDisposeFutureProvider<List<ChildModel>> {
  /// See also [getNotWaitListedChildrenInClass].
  GetNotWaitListedChildrenInClassProvider(
    String classroom,
  ) : this._internal(
          (ref) => getNotWaitListedChildrenInClass(
            ref as GetNotWaitListedChildrenInClassRef,
            classroom,
          ),
          from: getNotWaitListedChildrenInClassProvider,
          name: r'getNotWaitListedChildrenInClassProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNotWaitListedChildrenInClassHash,
          dependencies: GetNotWaitListedChildrenInClassFamily._dependencies,
          allTransitiveDependencies:
              GetNotWaitListedChildrenInClassFamily._allTransitiveDependencies,
          classroom: classroom,
        );

  GetNotWaitListedChildrenInClassProvider._internal(
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
    FutureOr<List<ChildModel>> Function(
            GetNotWaitListedChildrenInClassRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetNotWaitListedChildrenInClassProvider._internal(
        (ref) => create(ref as GetNotWaitListedChildrenInClassRef),
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
    return _GetNotWaitListedChildrenInClassProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetNotWaitListedChildrenInClassProvider &&
        other.classroom == classroom;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, classroom.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetNotWaitListedChildrenInClassRef
    on AutoDisposeFutureProviderRef<List<ChildModel>> {
  /// The parameter `classroom` of this provider.
  String get classroom;
}

class _GetNotWaitListedChildrenInClassProviderElement
    extends AutoDisposeFutureProviderElement<List<ChildModel>>
    with GetNotWaitListedChildrenInClassRef {
  _GetNotWaitListedChildrenInClassProviderElement(super.provider);

  @override
  String get classroom =>
      (origin as GetNotWaitListedChildrenInClassProvider).classroom;
}

String _$getWaitListedChildrenInClassHash() =>
    r'0865de069f582ce00e576628749cbe3bcd56801c';

/// See also [getWaitListedChildrenInClass].
@ProviderFor(getWaitListedChildrenInClass)
const getWaitListedChildrenInClassProvider =
    GetWaitListedChildrenInClassFamily();

/// See also [getWaitListedChildrenInClass].
class GetWaitListedChildrenInClassFamily
    extends Family<AsyncValue<List<ChildModel>>> {
  /// See also [getWaitListedChildrenInClass].
  const GetWaitListedChildrenInClassFamily();

  /// See also [getWaitListedChildrenInClass].
  GetWaitListedChildrenInClassProvider call(
    String classroom,
  ) {
    return GetWaitListedChildrenInClassProvider(
      classroom,
    );
  }

  @override
  GetWaitListedChildrenInClassProvider getProviderOverride(
    covariant GetWaitListedChildrenInClassProvider provider,
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
  String? get name => r'getWaitListedChildrenInClassProvider';
}

/// See also [getWaitListedChildrenInClass].
class GetWaitListedChildrenInClassProvider
    extends AutoDisposeFutureProvider<List<ChildModel>> {
  /// See also [getWaitListedChildrenInClass].
  GetWaitListedChildrenInClassProvider(
    String classroom,
  ) : this._internal(
          (ref) => getWaitListedChildrenInClass(
            ref as GetWaitListedChildrenInClassRef,
            classroom,
          ),
          from: getWaitListedChildrenInClassProvider,
          name: r'getWaitListedChildrenInClassProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getWaitListedChildrenInClassHash,
          dependencies: GetWaitListedChildrenInClassFamily._dependencies,
          allTransitiveDependencies:
              GetWaitListedChildrenInClassFamily._allTransitiveDependencies,
          classroom: classroom,
        );

  GetWaitListedChildrenInClassProvider._internal(
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
    FutureOr<List<ChildModel>> Function(
            GetWaitListedChildrenInClassRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetWaitListedChildrenInClassProvider._internal(
        (ref) => create(ref as GetWaitListedChildrenInClassRef),
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
    return _GetWaitListedChildrenInClassProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetWaitListedChildrenInClassProvider &&
        other.classroom == classroom;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, classroom.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetWaitListedChildrenInClassRef
    on AutoDisposeFutureProviderRef<List<ChildModel>> {
  /// The parameter `classroom` of this provider.
  String get classroom;
}

class _GetWaitListedChildrenInClassProviderElement
    extends AutoDisposeFutureProviderElement<List<ChildModel>>
    with GetWaitListedChildrenInClassRef {
  _GetWaitListedChildrenInClassProviderElement(super.provider);

  @override
  String get classroom =>
      (origin as GetWaitListedChildrenInClassProvider).classroom;
}

String _$getNotWaitListedChildrenInClassCountHash() =>
    r'a2bf193655f7e85ff0bd040b46b490d1abaad92c';

/// See also [getNotWaitListedChildrenInClassCount].
@ProviderFor(getNotWaitListedChildrenInClassCount)
const getNotWaitListedChildrenInClassCountProvider =
    GetNotWaitListedChildrenInClassCountFamily();

/// See also [getNotWaitListedChildrenInClassCount].
class GetNotWaitListedChildrenInClassCountFamily
    extends Family<AsyncValue<int>> {
  /// See also [getNotWaitListedChildrenInClassCount].
  const GetNotWaitListedChildrenInClassCountFamily();

  /// See also [getNotWaitListedChildrenInClassCount].
  GetNotWaitListedChildrenInClassCountProvider call(
    String classroom,
  ) {
    return GetNotWaitListedChildrenInClassCountProvider(
      classroom,
    );
  }

  @override
  GetNotWaitListedChildrenInClassCountProvider getProviderOverride(
    covariant GetNotWaitListedChildrenInClassCountProvider provider,
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
  String? get name => r'getNotWaitListedChildrenInClassCountProvider';
}

/// See also [getNotWaitListedChildrenInClassCount].
class GetNotWaitListedChildrenInClassCountProvider
    extends AutoDisposeFutureProvider<int> {
  /// See also [getNotWaitListedChildrenInClassCount].
  GetNotWaitListedChildrenInClassCountProvider(
    String classroom,
  ) : this._internal(
          (ref) => getNotWaitListedChildrenInClassCount(
            ref as GetNotWaitListedChildrenInClassCountRef,
            classroom,
          ),
          from: getNotWaitListedChildrenInClassCountProvider,
          name: r'getNotWaitListedChildrenInClassCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNotWaitListedChildrenInClassCountHash,
          dependencies:
              GetNotWaitListedChildrenInClassCountFamily._dependencies,
          allTransitiveDependencies: GetNotWaitListedChildrenInClassCountFamily
              ._allTransitiveDependencies,
          classroom: classroom,
        );

  GetNotWaitListedChildrenInClassCountProvider._internal(
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
    FutureOr<int> Function(GetNotWaitListedChildrenInClassCountRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetNotWaitListedChildrenInClassCountProvider._internal(
        (ref) => create(ref as GetNotWaitListedChildrenInClassCountRef),
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
  AutoDisposeFutureProviderElement<int> createElement() {
    return _GetNotWaitListedChildrenInClassCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetNotWaitListedChildrenInClassCountProvider &&
        other.classroom == classroom;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, classroom.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetNotWaitListedChildrenInClassCountRef
    on AutoDisposeFutureProviderRef<int> {
  /// The parameter `classroom` of this provider.
  String get classroom;
}

class _GetNotWaitListedChildrenInClassCountProviderElement
    extends AutoDisposeFutureProviderElement<int>
    with GetNotWaitListedChildrenInClassCountRef {
  _GetNotWaitListedChildrenInClassCountProviderElement(super.provider);

  @override
  String get classroom =>
      (origin as GetNotWaitListedChildrenInClassCountProvider).classroom;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
