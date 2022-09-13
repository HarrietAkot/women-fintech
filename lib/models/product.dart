// Product class definition
class Product {
  final int id;
  final String name;
  final String slug;
  final String permalink;
  final String image;
  final String? type;
  final String? status;
  final bool? featured;
  final String? description;
  final String? sku;
  final String category;
  final double price;
  final int lowStockAmount;
  final int? stockQuantity;
  final String? regularPrice;
  final String? salePrice;
  final dynamic totalSales;
  final String? stockStatus;
  final String? shortDescription;
  final String? catalogVisibility;
  final String? yoastHead;
  final DateTime? dateCreated;
  final DateTime? dateCreatedGmt;
  final DateTime? dateModified;
  final DateTime? dateModifiedGmt;
  final DateTime? dateOnSaleFrom;
  final DateTime? dateOnSaleFromGmt;
  final DateTime? dateOnSaleTo;
  final DateTime? dateOnSaleToGmt;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.image,
    this.type,
    this.status,
    required this.category,
    this.featured,
    this.sku,
    required this.price,
    required this.lowStockAmount,
    this.stockQuantity,
    this.regularPrice,
    this.salePrice,
    this.totalSales,
    this.stockStatus,
    this.shortDescription,
    this.catalogVisibility,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    this.description,
    this.yoastHead,
  });
}
