// mock_order_model.dart
class MockRazorpayOrder {
  final String orderId;
  final int amount;
  final String currency;
  final String receipt;

  MockRazorpayOrder({
    required this.orderId,
    required this.amount,
    required this.currency,
    required this.receipt,
  });

  // Simulate a fake order creation
  static MockRazorpayOrder createMockOrder() {
    return MockRazorpayOrder(
      orderId: "mock_order_12345",
      amount: 50000,
      currency: "INR",
      receipt: "mock_receipt_001",
    );
  }
}
