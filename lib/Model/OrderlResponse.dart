class Product {
  final int id;
  final int quantity;
  final String price;
  final String description;
  final String name;
  final String image;

  Product({
    required this.id,
    required this.quantity,
    required this.price,
    required this.description,
    required this.name,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      quantity: json['quantity'],
      price: json['price'],
      description: json['description'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class Details {
  final int discountCoupon;
  final int deliveryCost;
  final int firstCash;
  final int finalCash;
  final String userName;
  final String userPhone;
  final String anotherPhone;
  final String address;

  Details({
    required this.discountCoupon,
    required this.deliveryCost,
    required this.firstCash,
    required this.finalCash,
    required this.userName,
    required this.userPhone,
    required this.anotherPhone,
    required this.address,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      discountCoupon: json['discount_coupon'],
      deliveryCost: json['delivery_cost'],
      firstCash: json['first_cash'],
      finalCash: json['final_cash'],
      userName: json['user_name'],
      userPhone: json['user_phone'],
      anotherPhone: json['another_phone'],
      address: json['address'],
    );
  }
}

class CurrentOrderResponse {
  final List<Product> products;
  final Details userDetails;
  final String status;
  final String message;

  CurrentOrderResponse({
    required this.products,
    required this.userDetails,
    required this.status,
    required this.message,
  });

  factory CurrentOrderResponse.fromJson(Map<String, dynamic> json) {
    List<Product> products = (json['data']['products'] as List)
        .map((productJson) => Product.fromJson(productJson))
        .toList();

    Details userDetails = Details.fromJson(json['data']['details']);

    return CurrentOrderResponse(
      products: products,
      userDetails: userDetails,
      status: json['status'],
      message: json['message'],
    );
  }
}

