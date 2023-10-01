
class OrderDto {
  OrderDto({
    required this.title,
    required this.description,
    required this.customerId,
    required this.price,
  });

  final String title;
  final String description;
  final String customerId;
  final int price;
}
