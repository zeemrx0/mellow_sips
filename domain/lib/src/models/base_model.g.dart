// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TestModelCWProxy {
  TestModel message(String message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TestModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TestModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TestModel call({
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTestModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTestModel.copyWith.fieldName(...)`
class _$TestModelCWProxyImpl implements _$TestModelCWProxy {
  const _$TestModelCWProxyImpl(this._value);

  final TestModel _value;

  @override
  TestModel message(String message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TestModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TestModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TestModel call({
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return TestModel(
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
    );
  }
}

extension $TestModelCopyWith on TestModel {
  /// Returns a callable class that can be used as follows: `instanceOfTestModel.copyWith(...)` or like so:`instanceOfTestModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TestModelCWProxy get copyWith => _$TestModelCWProxyImpl(this);
}

abstract class _$TokensModelCWProxy {
  TokensModel accessToken(String accessToken);

  TokensModel refreshToken(String refreshToken);

  TokensModel idToken(String idToken);

  TokensModel expiresIn(int expiresIn);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TokensModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TokensModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TokensModel call({
    String? accessToken,
    String? refreshToken,
    String? idToken,
    int? expiresIn,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTokensModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTokensModel.copyWith.fieldName(...)`
class _$TokensModelCWProxyImpl implements _$TokensModelCWProxy {
  const _$TokensModelCWProxyImpl(this._value);

  final TokensModel _value;

  @override
  TokensModel accessToken(String accessToken) => this(accessToken: accessToken);

  @override
  TokensModel refreshToken(String refreshToken) =>
      this(refreshToken: refreshToken);

  @override
  TokensModel idToken(String idToken) => this(idToken: idToken);

  @override
  TokensModel expiresIn(int expiresIn) => this(expiresIn: expiresIn);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TokensModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TokensModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TokensModel call({
    Object? accessToken = const $CopyWithPlaceholder(),
    Object? refreshToken = const $CopyWithPlaceholder(),
    Object? idToken = const $CopyWithPlaceholder(),
    Object? expiresIn = const $CopyWithPlaceholder(),
  }) {
    return TokensModel(
      accessToken:
          accessToken == const $CopyWithPlaceholder() || accessToken == null
              ? _value.accessToken
              // ignore: cast_nullable_to_non_nullable
              : accessToken as String,
      refreshToken:
          refreshToken == const $CopyWithPlaceholder() || refreshToken == null
              ? _value.refreshToken
              // ignore: cast_nullable_to_non_nullable
              : refreshToken as String,
      idToken: idToken == const $CopyWithPlaceholder() || idToken == null
          ? _value.idToken
          // ignore: cast_nullable_to_non_nullable
          : idToken as String,
      expiresIn: expiresIn == const $CopyWithPlaceholder() || expiresIn == null
          ? _value.expiresIn
          // ignore: cast_nullable_to_non_nullable
          : expiresIn as int,
    );
  }
}

extension $TokensModelCopyWith on TokensModel {
  /// Returns a callable class that can be used as follows: `instanceOfTokensModel.copyWith(...)` or like so:`instanceOfTokensModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TokensModelCWProxy get copyWith => _$TokensModelCWProxyImpl(this);
}

abstract class _$DocumentModelCWProxy {
  DocumentModel content(String content);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DocumentModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DocumentModel(...).copyWith(id: 12, name: "My name")
  /// ````
  DocumentModel call({
    String? content,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDocumentModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDocumentModel.copyWith.fieldName(...)`
class _$DocumentModelCWProxyImpl implements _$DocumentModelCWProxy {
  const _$DocumentModelCWProxyImpl(this._value);

  final DocumentModel _value;

  @override
  DocumentModel content(String content) => this(content: content);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DocumentModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DocumentModel(...).copyWith(id: 12, name: "My name")
  /// ````
  DocumentModel call({
    Object? content = const $CopyWithPlaceholder(),
  }) {
    return DocumentModel(
      content: content == const $CopyWithPlaceholder() || content == null
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as String,
    );
  }
}

extension $DocumentModelCopyWith on DocumentModel {
  /// Returns a callable class that can be used as follows: `instanceOfDocumentModel.copyWith(...)` or like so:`instanceOfDocumentModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DocumentModelCWProxy get copyWith => _$DocumentModelCWProxyImpl(this);
}

abstract class _$StoreModelCWProxy {
  StoreModel id(String? id);

  StoreModel coverImage(String? coverImage);

  StoreModel name(String? name);

  StoreModel type(String? type);

  StoreModel hasPromotion(bool? hasPromotion);

  StoreModel isWorking(bool? isWorking);

  StoreModel rating(double? rating);

  StoreModel address(String? address);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StoreModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StoreModel(...).copyWith(id: 12, name: "My name")
  /// ````
  StoreModel call({
    String? id,
    String? coverImage,
    String? name,
    String? type,
    bool? hasPromotion,
    bool? isWorking,
    double? rating,
    String? address,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStoreModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStoreModel.copyWith.fieldName(...)`
class _$StoreModelCWProxyImpl implements _$StoreModelCWProxy {
  const _$StoreModelCWProxyImpl(this._value);

  final StoreModel _value;

  @override
  StoreModel id(String? id) => this(id: id);

  @override
  StoreModel coverImage(String? coverImage) => this(coverImage: coverImage);

  @override
  StoreModel name(String? name) => this(name: name);

  @override
  StoreModel type(String? type) => this(type: type);

  @override
  StoreModel hasPromotion(bool? hasPromotion) =>
      this(hasPromotion: hasPromotion);

  @override
  StoreModel isWorking(bool? isWorking) => this(isWorking: isWorking);

  @override
  StoreModel rating(double? rating) => this(rating: rating);

  @override
  StoreModel address(String? address) => this(address: address);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StoreModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StoreModel(...).copyWith(id: 12, name: "My name")
  /// ````
  StoreModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? coverImage = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? hasPromotion = const $CopyWithPlaceholder(),
    Object? isWorking = const $CopyWithPlaceholder(),
    Object? rating = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
  }) {
    return StoreModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      coverImage: coverImage == const $CopyWithPlaceholder()
          ? _value.coverImage
          // ignore: cast_nullable_to_non_nullable
          : coverImage as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
      hasPromotion: hasPromotion == const $CopyWithPlaceholder()
          ? _value.hasPromotion
          // ignore: cast_nullable_to_non_nullable
          : hasPromotion as bool?,
      isWorking: isWorking == const $CopyWithPlaceholder()
          ? _value.isWorking
          // ignore: cast_nullable_to_non_nullable
          : isWorking as bool?,
      rating: rating == const $CopyWithPlaceholder()
          ? _value.rating
          // ignore: cast_nullable_to_non_nullable
          : rating as double?,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String?,
    );
  }
}

extension $StoreModelCopyWith on StoreModel {
  /// Returns a callable class that can be used as follows: `instanceOfStoreModel.copyWith(...)` or like so:`instanceOfStoreModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StoreModelCWProxy get copyWith => _$StoreModelCWProxyImpl(this);
}

abstract class _$ProductModelCWProxy {
  ProductModel id(String? id);

  ProductModel name(String? name);

  ProductModel description(String? description);

  ProductModel coverImage(String? coverImage);

  ProductModel price(int? price);

  ProductModel categories(List<String>? categories);

  ProductModel tags(List<String>? tags);

  ProductModel isSoldOut(bool? isSoldOut);

  ProductModel productOptionSections(
      List<ProductOptionSectionModel>? productOptionSections);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductModel call({
    String? id,
    String? name,
    String? description,
    String? coverImage,
    int? price,
    List<String>? categories,
    List<String>? tags,
    bool? isSoldOut,
    List<ProductOptionSectionModel>? productOptionSections,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductModel.copyWith.fieldName(...)`
class _$ProductModelCWProxyImpl implements _$ProductModelCWProxy {
  const _$ProductModelCWProxyImpl(this._value);

  final ProductModel _value;

  @override
  ProductModel id(String? id) => this(id: id);

  @override
  ProductModel name(String? name) => this(name: name);

  @override
  ProductModel description(String? description) =>
      this(description: description);

  @override
  ProductModel coverImage(String? coverImage) => this(coverImage: coverImage);

  @override
  ProductModel price(int? price) => this(price: price);

  @override
  ProductModel categories(List<String>? categories) =>
      this(categories: categories);

  @override
  ProductModel tags(List<String>? tags) => this(tags: tags);

  @override
  ProductModel isSoldOut(bool? isSoldOut) => this(isSoldOut: isSoldOut);

  @override
  ProductModel productOptionSections(
          List<ProductOptionSectionModel>? productOptionSections) =>
      this(productOptionSections: productOptionSections);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? coverImage = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? categories = const $CopyWithPlaceholder(),
    Object? tags = const $CopyWithPlaceholder(),
    Object? isSoldOut = const $CopyWithPlaceholder(),
    Object? productOptionSections = const $CopyWithPlaceholder(),
  }) {
    return ProductModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      coverImage: coverImage == const $CopyWithPlaceholder()
          ? _value.coverImage
          // ignore: cast_nullable_to_non_nullable
          : coverImage as String?,
      price: price == const $CopyWithPlaceholder()
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as int?,
      categories: categories == const $CopyWithPlaceholder()
          ? _value.categories
          // ignore: cast_nullable_to_non_nullable
          : categories as List<String>?,
      tags: tags == const $CopyWithPlaceholder()
          ? _value.tags
          // ignore: cast_nullable_to_non_nullable
          : tags as List<String>?,
      isSoldOut: isSoldOut == const $CopyWithPlaceholder()
          ? _value.isSoldOut
          // ignore: cast_nullable_to_non_nullable
          : isSoldOut as bool?,
      productOptionSections:
          productOptionSections == const $CopyWithPlaceholder()
              ? _value.productOptionSections
              // ignore: cast_nullable_to_non_nullable
              : productOptionSections as List<ProductOptionSectionModel>?,
    );
  }
}

extension $ProductModelCopyWith on ProductModel {
  /// Returns a callable class that can be used as follows: `instanceOfProductModel.copyWith(...)` or like so:`instanceOfProductModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductModelCWProxy get copyWith => _$ProductModelCWProxyImpl(this);
}

abstract class _$MenuSectionModelCWProxy {
  MenuSectionModel name(String name);

  MenuSectionModel order(int order);

  MenuSectionModel products(List<ProductModel> products);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuSectionModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuSectionModel(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuSectionModel call({
    String? name,
    int? order,
    List<ProductModel>? products,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMenuSectionModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMenuSectionModel.copyWith.fieldName(...)`
class _$MenuSectionModelCWProxyImpl implements _$MenuSectionModelCWProxy {
  const _$MenuSectionModelCWProxyImpl(this._value);

  final MenuSectionModel _value;

  @override
  MenuSectionModel name(String name) => this(name: name);

  @override
  MenuSectionModel order(int order) => this(order: order);

  @override
  MenuSectionModel products(List<ProductModel> products) =>
      this(products: products);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuSectionModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuSectionModel(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuSectionModel call({
    Object? name = const $CopyWithPlaceholder(),
    Object? order = const $CopyWithPlaceholder(),
    Object? products = const $CopyWithPlaceholder(),
  }) {
    return MenuSectionModel(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      order: order == const $CopyWithPlaceholder() || order == null
          ? _value.order
          // ignore: cast_nullable_to_non_nullable
          : order as int,
      products: products == const $CopyWithPlaceholder() || products == null
          ? _value.products
          // ignore: cast_nullable_to_non_nullable
          : products as List<ProductModel>,
    );
  }
}

extension $MenuSectionModelCopyWith on MenuSectionModel {
  /// Returns a callable class that can be used as follows: `instanceOfMenuSectionModel.copyWith(...)` or like so:`instanceOfMenuSectionModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MenuSectionModelCWProxy get copyWith => _$MenuSectionModelCWProxyImpl(this);
}

abstract class _$MenuModelCWProxy {
  MenuModel id(String id);

  MenuModel menuSections(List<MenuSectionModel> menuSections);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuModel(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuModel call({
    String? id,
    List<MenuSectionModel>? menuSections,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMenuModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMenuModel.copyWith.fieldName(...)`
class _$MenuModelCWProxyImpl implements _$MenuModelCWProxy {
  const _$MenuModelCWProxyImpl(this._value);

  final MenuModel _value;

  @override
  MenuModel id(String id) => this(id: id);

  @override
  MenuModel menuSections(List<MenuSectionModel> menuSections) =>
      this(menuSections: menuSections);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuModel(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? menuSections = const $CopyWithPlaceholder(),
  }) {
    return MenuModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      menuSections:
          menuSections == const $CopyWithPlaceholder() || menuSections == null
              ? _value.menuSections
              // ignore: cast_nullable_to_non_nullable
              : menuSections as List<MenuSectionModel>,
    );
  }
}

extension $MenuModelCopyWith on MenuModel {
  /// Returns a callable class that can be used as follows: `instanceOfMenuModel.copyWith(...)` or like so:`instanceOfMenuModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MenuModelCWProxy get copyWith => _$MenuModelCWProxyImpl(this);
}

abstract class _$ProductOptionSectionModelCWProxy {
  ProductOptionSectionModel name(String name);

  ProductOptionSectionModel order(int order);

  ProductOptionSectionModel isRequired(bool isRequired);

  ProductOptionSectionModel maxAllowedChoices(int maxAllowedChoices);

  ProductOptionSectionModel productAddons(
      List<ProductAddonModel> productAddons);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductOptionSectionModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductOptionSectionModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductOptionSectionModel call({
    String? name,
    int? order,
    bool? isRequired,
    int? maxAllowedChoices,
    List<ProductAddonModel>? productAddons,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductOptionSectionModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductOptionSectionModel.copyWith.fieldName(...)`
class _$ProductOptionSectionModelCWProxyImpl
    implements _$ProductOptionSectionModelCWProxy {
  const _$ProductOptionSectionModelCWProxyImpl(this._value);

  final ProductOptionSectionModel _value;

  @override
  ProductOptionSectionModel name(String name) => this(name: name);

  @override
  ProductOptionSectionModel order(int order) => this(order: order);

  @override
  ProductOptionSectionModel isRequired(bool isRequired) =>
      this(isRequired: isRequired);

  @override
  ProductOptionSectionModel maxAllowedChoices(int maxAllowedChoices) =>
      this(maxAllowedChoices: maxAllowedChoices);

  @override
  ProductOptionSectionModel productAddons(
          List<ProductAddonModel> productAddons) =>
      this(productAddons: productAddons);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductOptionSectionModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductOptionSectionModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductOptionSectionModel call({
    Object? name = const $CopyWithPlaceholder(),
    Object? order = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? maxAllowedChoices = const $CopyWithPlaceholder(),
    Object? productAddons = const $CopyWithPlaceholder(),
  }) {
    return ProductOptionSectionModel(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      order: order == const $CopyWithPlaceholder() || order == null
          ? _value.order
          // ignore: cast_nullable_to_non_nullable
          : order as int,
      isRequired:
          isRequired == const $CopyWithPlaceholder() || isRequired == null
              ? _value.isRequired
              // ignore: cast_nullable_to_non_nullable
              : isRequired as bool,
      maxAllowedChoices: maxAllowedChoices == const $CopyWithPlaceholder() ||
              maxAllowedChoices == null
          ? _value.maxAllowedChoices
          // ignore: cast_nullable_to_non_nullable
          : maxAllowedChoices as int,
      productAddons:
          productAddons == const $CopyWithPlaceholder() || productAddons == null
              ? _value.productAddons
              // ignore: cast_nullable_to_non_nullable
              : productAddons as List<ProductAddonModel>,
    );
  }
}

extension $ProductOptionSectionModelCopyWith on ProductOptionSectionModel {
  /// Returns a callable class that can be used as follows: `instanceOfProductOptionSectionModel.copyWith(...)` or like so:`instanceOfProductOptionSectionModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductOptionSectionModelCWProxy get copyWith =>
      _$ProductOptionSectionModelCWProxyImpl(this);
}

abstract class _$ProductAddonModelCWProxy {
  ProductAddonModel id(String id);

  ProductAddonModel name(String name);

  ProductAddonModel price(int price);

  ProductAddonModel isSoldOut(bool isSoldOut);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductAddonModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductAddonModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductAddonModel call({
    String? id,
    String? name,
    int? price,
    bool? isSoldOut,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductAddonModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductAddonModel.copyWith.fieldName(...)`
class _$ProductAddonModelCWProxyImpl implements _$ProductAddonModelCWProxy {
  const _$ProductAddonModelCWProxyImpl(this._value);

  final ProductAddonModel _value;

  @override
  ProductAddonModel id(String id) => this(id: id);

  @override
  ProductAddonModel name(String name) => this(name: name);

  @override
  ProductAddonModel price(int price) => this(price: price);

  @override
  ProductAddonModel isSoldOut(bool isSoldOut) => this(isSoldOut: isSoldOut);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductAddonModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductAddonModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductAddonModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? isSoldOut = const $CopyWithPlaceholder(),
  }) {
    return ProductAddonModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      price: price == const $CopyWithPlaceholder() || price == null
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as int,
      isSoldOut: isSoldOut == const $CopyWithPlaceholder() || isSoldOut == null
          ? _value.isSoldOut
          // ignore: cast_nullable_to_non_nullable
          : isSoldOut as bool,
    );
  }
}

extension $ProductAddonModelCopyWith on ProductAddonModel {
  /// Returns a callable class that can be used as follows: `instanceOfProductAddonModel.copyWith(...)` or like so:`instanceOfProductAddonModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductAddonModelCWProxy get copyWith =>
      _$ProductAddonModelCWProxyImpl(this);
}

abstract class _$CartModelCWProxy {
  CartModel id(String id);

  CartModel store(StoreModel store);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CartModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CartModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CartModel call({
    String? id,
    StoreModel? store,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCartModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCartModel.copyWith.fieldName(...)`
class _$CartModelCWProxyImpl implements _$CartModelCWProxy {
  const _$CartModelCWProxyImpl(this._value);

  final CartModel _value;

  @override
  CartModel id(String id) => this(id: id);

  @override
  CartModel store(StoreModel store) => this(store: store);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CartModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CartModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CartModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? store = const $CopyWithPlaceholder(),
  }) {
    return CartModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      store: store == const $CopyWithPlaceholder() || store == null
          ? _value.store
          // ignore: cast_nullable_to_non_nullable
          : store as StoreModel,
    );
  }
}

extension $CartModelCopyWith on CartModel {
  /// Returns a callable class that can be used as follows: `instanceOfCartModel.copyWith(...)` or like so:`instanceOfCartModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CartModelCWProxy get copyWith => _$CartModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestModel _$TestModelFromJson(Map<String, dynamic> json) => TestModel(
      message: json['message'] as String,
    );

Map<String, dynamic> _$TestModelToJson(TestModel instance) => <String, dynamic>{
      'message': instance.message,
    };

TokensModel _$TokensModelFromJson(Map<String, dynamic> json) => TokensModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      idToken: json['idToken'] as String,
      expiresIn: json['expiresIn'] as int,
    );

Map<String, dynamic> _$TokensModelToJson(TokensModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'idToken': instance.idToken,
      'expiresIn': instance.expiresIn,
    };

DocumentModel _$DocumentModelFromJson(Map<String, dynamic> json) =>
    DocumentModel(
      content: json['content'] as String,
    );

Map<String, dynamic> _$DocumentModelToJson(DocumentModel instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      id: json['id'] as String?,
      coverImage: json['coverImage'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      hasPromotion: json['hasPromotion'] as bool?,
      isWorking: json['isWorking'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coverImage': instance.coverImage,
      'name': instance.name,
      'type': instance.type,
      'hasPromotion': instance.hasPromotion,
      'isWorking': instance.isWorking,
      'rating': instance.rating,
      'address': instance.address,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      coverImage: json['coverImage'] as String?,
      price: json['price'] as int?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isSoldOut: json['isSoldOut'] as bool?,
      productOptionSections: (json['productOptionSections'] as List<dynamic>?)
          ?.map((e) =>
              ProductOptionSectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'coverImage': instance.coverImage,
      'price': instance.price,
      'categories': instance.categories,
      'tags': instance.tags,
      'isSoldOut': instance.isSoldOut,
      'productOptionSections': instance.productOptionSections,
    };

MenuSectionModel _$MenuSectionModelFromJson(Map<String, dynamic> json) =>
    MenuSectionModel(
      name: json['name'] as String,
      order: json['order'] as int,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuSectionModelToJson(MenuSectionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'order': instance.order,
      'products': instance.products,
    };

MenuModel _$MenuModelFromJson(Map<String, dynamic> json) => MenuModel(
      id: json['id'] as String,
      menuSections: (json['menuSections'] as List<dynamic>)
          .map((e) => MenuSectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuModelToJson(MenuModel instance) => <String, dynamic>{
      'id': instance.id,
      'menuSections': instance.menuSections,
    };

ProductOptionSectionModel _$ProductOptionSectionModelFromJson(
        Map<String, dynamic> json) =>
    ProductOptionSectionModel(
      name: json['name'] as String,
      order: json['order'] as int,
      isRequired: json['isRequired'] as bool,
      maxAllowedChoices: json['maxAllowedChoices'] as int,
      productAddons: (json['productAddons'] as List<dynamic>)
          .map((e) => ProductAddonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductOptionSectionModelToJson(
        ProductOptionSectionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'order': instance.order,
      'isRequired': instance.isRequired,
      'maxAllowedChoices': instance.maxAllowedChoices,
      'productAddons': instance.productAddons,
    };

ProductAddonModel _$ProductAddonModelFromJson(Map<String, dynamic> json) =>
    ProductAddonModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      isSoldOut: json['isSoldOut'] as bool,
    );

Map<String, dynamic> _$ProductAddonModelToJson(ProductAddonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'isSoldOut': instance.isSoldOut,
    };

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      id: json['id'] as String,
      store: StoreModel.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'store': instance.store,
    };
