// Mocks generated by Mockito 5.3.2 from annotations
// in flota/test/widget/debug/select_language_dialog_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i3;

import 'package:flutter/material.dart' as _i4;
import 'package:flota/util/locale/localization.dart' as _i6;
import 'package:flota/viewmodel/global/global_viewmodel.dart' as _i2;
import 'package:icapps_architecture/icapps_architecture.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [GlobalViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockGlobalViewModel extends _i1.Mock implements _i2.GlobalViewModel {
  MockGlobalViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i3.Locale> get supportedLocales => (super.noSuchMethod(
        Invocation.getter(#supportedLocales),
        returnValue: <_i3.Locale>[],
      ) as List<_i3.Locale>);
  @override
  _i4.ThemeMode get themeMode => (super.noSuchMethod(
        Invocation.getter(#themeMode),
        returnValue: _i4.ThemeMode.system,
      ) as _i4.ThemeMode);
  @override
  bool get showsTranslationKeys => (super.noSuchMethod(
        Invocation.getter(#showsTranslationKeys),
        returnValue: false,
      ) as bool);
  @override
  bool get disposed => (super.noSuchMethod(
        Invocation.getter(#disposed),
        returnValue: false,
      ) as bool);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  _i5.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> updateThemeMode(_i4.ThemeMode? themeMode) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateThemeMode,
          [themeMode],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> onSwitchToDutch() => (super.noSuchMethod(
        Invocation.method(
          #onSwitchToDutch,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> onSwitchToEnglish() => (super.noSuchMethod(
        Invocation.method(
          #onSwitchToEnglish,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> onSwitchToSystemLanguage() => (super.noSuchMethod(
        Invocation.method(
          #onSwitchToSystemLanguage,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> setSelectedPlatformToAndroid() => (super.noSuchMethod(
        Invocation.method(
          #setSelectedPlatformToAndroid,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> setSelectedPlatformToIOS() => (super.noSuchMethod(
        Invocation.method(
          #setSelectedPlatformToIOS,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> setSelectedPlatformToDefault() => (super.noSuchMethod(
        Invocation.method(
          #setSelectedPlatformToDefault,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  String getCurrentPlatform() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentPlatform,
          [],
        ),
        returnValue: '',
      ) as String);
  @override
  String getAppearanceValue(_i6.Localization? localization) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAppearanceValue,
          [localization],
        ),
        returnValue: '',
      ) as String);
  @override
  String getCurrentLanguage() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentLanguage,
          [],
        ),
        returnValue: '',
      ) as String);
  @override
  bool isLanguageSelected(String? languageCode) => (super.noSuchMethod(
        Invocation.method(
          #isLanguageSelected,
          [languageCode],
        ),
        returnValue: false,
      ) as bool);
  @override
  void toggleTranslationKeys() => super.noSuchMethod(
        Invocation.method(
          #toggleTranslationKeys,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addListener(_i3.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i3.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerDispose(_i7.DisposeAware? toDispose) => super.noSuchMethod(
        Invocation.method(
          #registerDispose,
          [toDispose],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerDisposeStream<T>(_i5.StreamSubscription<T>? subscription) =>
      super.noSuchMethod(
        Invocation.method(
          #registerDisposeStream,
          [subscription],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
