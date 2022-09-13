import 'package:json_annotation/json_annotation.dart';

// part 'order.g.dart';

class Order {
  final int id;
  final String status;
  final String currency;

  final dynamic total;

  @JsonKey(name: 'parent_id')
  final int parentId;

  @JsonKey(name: 'customer_id')
  final int customerId;

  @JsonKey(name: 'prices_include_tax')
  final bool pricesIncludeTax;

  @JsonKey(name: 'date_created')
  final DateTime dateCreated;

  @JsonKey(name: 'date_modified')
  final DateTime dateModified;

  @JsonKey(name: 'order_key')
  final String orderKey;

  @JsonKey(name: 'payment_method')
  final String paymentMethod;

  @JsonKey(name: 'payment_method_title')
  final String paymentMethodTitle;

  final CustomerDetails billing;
  final CustomerDetails shipping;

  @JsonKey(name: 'meta_data')
  final List<MetaData>? metadata;

  @JsonKey(name: 'created_via')
  final String createdVia;

  @JsonKey(name: 'customer_note')
  final String customerNote;

  @JsonKey(name: 'date_completed')
  final DateTime? dateCompleted;

  @JsonKey(name: 'date_paid')
  final DateTime? datePaid;

  @JsonKey(name: 'cart_hash')
  final String cartHash;

  final String number;

  @JsonKey(name: 'line_items')
  final List<OrderLineItem> lineItems;

  // @JsonKey(name: '_links')
  // final GSLink? links;

  Order({
    required this.id,
    required this.status,
    required this.currency,
    required this.total,
    required this.parentId,
    required this.customerId,
    required this.pricesIncludeTax,
    required this.dateCreated,
    required this.dateModified,
    required this.orderKey,
    required this.paymentMethod,
    required this.paymentMethodTitle,
    required this.billing,
    required this.shipping,
    required this.createdVia,
    required this.customerNote,
    required this.cartHash,
    required this.number,
    required this.lineItems,
    this.dateCompleted,
    this.datePaid,
    this.metadata,
    // this.links,
  });

  // // convert from JSON to Order class instance
  // factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  // // convert from Order class instance to JSON
  // Map<String, dynamic> toJson() => _$OrderToJson(this);
}

class CustomerDetails {
  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'address_1')
  final String address1;

  @JsonKey(name: 'address_2')
  final String address2;

  final String company;
  final String city;
  final String state;
  final String postcode;
  final String country;
  final String phone;
  final String? email;

  CustomerDetails({
    required this.firstName,
    required this.lastName,
    required this.address1,
    required this.address2,
    required this.company,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
    required this.phone,
    this.email,
  });

  // // convert from JSON to CustomerDetails class instance
  // factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
  //     _$CustomerDetailsFromJson(json);

  // // convert from CustomerDetails class instance to JSON
  // Map<String, dynamic> toJson() => _$CustomerDetailsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderLineItem {
  final int id;
  final String name;
  final int quantity;
  final dynamic price;
  final dynamic subtotal;
  final dynamic total;
  final String? sku;

  @JsonKey(name: 'product_id')
  final int productId;

  @JsonKey(name: 'variation_id')
  final int? variationId;

  @JsonKey(name: 'tax_class')
  final String? taxClass;

  OrderLineItem({
    required this.id,
    required this.name,
    required this.productId,
    required this.quantity,
    required this.subtotal,
    required this.total,
    this.sku,
    this.price,
    this.variationId,
    this.taxClass,
  });

  // // convert from JSON to OrderLineItem class instance
  // factory OrderLineItem.fromJson(Map<String, dynamic> json) =>
  //     _$OrderLineItemFromJson(json);

  // // convert from OrderLineItem class instance to JSON
  // Map<String, dynamic> toJson() => _$OrderLineItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MetaData {
  final int id;
  final String key;
  final dynamic value;

  MetaData({
    required this.id,
    required this.key,
    required this.value,
  });

  // // convert from JSON to MetaData class instance
  // factory MetaData.fromJson(Map<String, dynamic> json) =>
  //     _$MetaDataFromJson(json);

  // // convert from MetaData class instance to JSON
  // Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}
