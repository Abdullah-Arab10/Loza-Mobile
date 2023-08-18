// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$_LoginObjectCopyWith(
          _$_LoginObject value, $Res Function(_$_LoginObject) then) =
      __$$_LoginObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_LoginObjectCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$_LoginObject>
    implements _$$_LoginObjectCopyWith<$Res> {
  __$$_LoginObjectCopyWithImpl(
      _$_LoginObject _value, $Res Function(_$_LoginObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_LoginObject(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginObject &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      __$$_LoginObjectCopyWithImpl<_$_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String email, final String password) =
      _$_LoginObject;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterObject {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterObjectCopyWith<RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterObjectCopyWith<$Res> {
  factory $RegisterObjectCopyWith(
          RegisterObject value, $Res Function(RegisterObject) then) =
      _$RegisterObjectCopyWithImpl<$Res, RegisterObject>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      String phoneNumber,
      String address,
      String dateOfBirth});
}

/// @nodoc
class _$RegisterObjectCopyWithImpl<$Res, $Val extends RegisterObject>
    implements $RegisterObjectCopyWith<$Res> {
  _$RegisterObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? dateOfBirth = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterObjectCopyWith<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  factory _$$_RegisterObjectCopyWith(
          _$_RegisterObject value, $Res Function(_$_RegisterObject) then) =
      __$$_RegisterObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      String phoneNumber,
      String address,
      String dateOfBirth});
}

/// @nodoc
class __$$_RegisterObjectCopyWithImpl<$Res>
    extends _$RegisterObjectCopyWithImpl<$Res, _$_RegisterObject>
    implements _$$_RegisterObjectCopyWith<$Res> {
  __$$_RegisterObjectCopyWithImpl(
      _$_RegisterObject _value, $Res Function(_$_RegisterObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? dateOfBirth = null,
  }) {
    return _then(_$_RegisterObject(
      null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterObject implements _RegisterObject {
  _$_RegisterObject(this.firstName, this.lastName, this.email, this.password,
      this.phoneNumber, this.address, this.dateOfBirth);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String phoneNumber;
  @override
  final String address;
  @override
  final String dateOfBirth;

  @override
  String toString() {
    return 'RegisterObject(firstName: $firstName, lastName: $lastName, email: $email, password: $password, phoneNumber: $phoneNumber, address: $address, dateOfBirth: $dateOfBirth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterObject &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email,
      password, phoneNumber, address, dateOfBirth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterObjectCopyWith<_$_RegisterObject> get copyWith =>
      __$$_RegisterObjectCopyWithImpl<_$_RegisterObject>(this, _$identity);
}

abstract class _RegisterObject implements RegisterObject {
  factory _RegisterObject(
      final String firstName,
      final String lastName,
      final String email,
      final String password,
      final String phoneNumber,
      final String address,
      final String dateOfBirth) = _$_RegisterObject;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get password;
  @override
  String get phoneNumber;
  @override
  String get address;
  @override
  String get dateOfBirth;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterObjectCopyWith<_$_RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddAddressObject {
  String get location => throw _privateConstructorUsedError;
  String get addressName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddAddressObjectCopyWith<AddAddressObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddAddressObjectCopyWith<$Res> {
  factory $AddAddressObjectCopyWith(
          AddAddressObject value, $Res Function(AddAddressObject) then) =
      _$AddAddressObjectCopyWithImpl<$Res, AddAddressObject>;
  @useResult
  $Res call({String location, String addressName});
}

/// @nodoc
class _$AddAddressObjectCopyWithImpl<$Res, $Val extends AddAddressObject>
    implements $AddAddressObjectCopyWith<$Res> {
  _$AddAddressObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? addressName = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      addressName: null == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddAddressObjectCopyWith<$Res>
    implements $AddAddressObjectCopyWith<$Res> {
  factory _$$_AddAddressObjectCopyWith(
          _$_AddAddressObject value, $Res Function(_$_AddAddressObject) then) =
      __$$_AddAddressObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String location, String addressName});
}

/// @nodoc
class __$$_AddAddressObjectCopyWithImpl<$Res>
    extends _$AddAddressObjectCopyWithImpl<$Res, _$_AddAddressObject>
    implements _$$_AddAddressObjectCopyWith<$Res> {
  __$$_AddAddressObjectCopyWithImpl(
      _$_AddAddressObject _value, $Res Function(_$_AddAddressObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? addressName = null,
  }) {
    return _then(_$_AddAddressObject(
      null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      null == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddAddressObject implements _AddAddressObject {
  _$_AddAddressObject(this.location, this.addressName);

  @override
  final String location;
  @override
  final String addressName;

  @override
  String toString() {
    return 'AddAddressObject(location: $location, addressName: $addressName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddAddressObject &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.addressName, addressName) ||
                other.addressName == addressName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, location, addressName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddAddressObjectCopyWith<_$_AddAddressObject> get copyWith =>
      __$$_AddAddressObjectCopyWithImpl<_$_AddAddressObject>(this, _$identity);
}

abstract class _AddAddressObject implements AddAddressObject {
  factory _AddAddressObject(final String location, final String addressName) =
      _$_AddAddressObject;

  @override
  String get location;
  @override
  String get addressName;
  @override
  @JsonKey(ignore: true)
  _$$_AddAddressObjectCopyWith<_$_AddAddressObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddReviewObject {
  String get review => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddReviewObjectCopyWith<AddReviewObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddReviewObjectCopyWith<$Res> {
  factory $AddReviewObjectCopyWith(
          AddReviewObject value, $Res Function(AddReviewObject) then) =
      _$AddReviewObjectCopyWithImpl<$Res, AddReviewObject>;
  @useResult
  $Res call({String review});
}

/// @nodoc
class _$AddReviewObjectCopyWithImpl<$Res, $Val extends AddReviewObject>
    implements $AddReviewObjectCopyWith<$Res> {
  _$AddReviewObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? review = null,
  }) {
    return _then(_value.copyWith(
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddReviewObjectCopyWith<$Res>
    implements $AddReviewObjectCopyWith<$Res> {
  factory _$$_AddReviewObjectCopyWith(
          _$_AddReviewObject value, $Res Function(_$_AddReviewObject) then) =
      __$$_AddReviewObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String review});
}

/// @nodoc
class __$$_AddReviewObjectCopyWithImpl<$Res>
    extends _$AddReviewObjectCopyWithImpl<$Res, _$_AddReviewObject>
    implements _$$_AddReviewObjectCopyWith<$Res> {
  __$$_AddReviewObjectCopyWithImpl(
      _$_AddReviewObject _value, $Res Function(_$_AddReviewObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? review = null,
  }) {
    return _then(_$_AddReviewObject(
      null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddReviewObject implements _AddReviewObject {
  _$_AddReviewObject(this.review);

  @override
  final String review;

  @override
  String toString() {
    return 'AddReviewObject(review: $review)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddReviewObject &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode => Object.hash(runtimeType, review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddReviewObjectCopyWith<_$_AddReviewObject> get copyWith =>
      __$$_AddReviewObjectCopyWithImpl<_$_AddReviewObject>(this, _$identity);
}

abstract class _AddReviewObject implements AddReviewObject {
  factory _AddReviewObject(final String review) = _$_AddReviewObject;

  @override
  String get review;
  @override
  @JsonKey(ignore: true)
  _$$_AddReviewObjectCopyWith<_$_AddReviewObject> get copyWith =>
      throw _privateConstructorUsedError;
}
