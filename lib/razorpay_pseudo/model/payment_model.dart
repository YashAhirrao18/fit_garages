// mock_payment_response_model.dart
class MockPaymentResponse {
  final String paymentId;
  final String status;
  final String orderId;

  MockPaymentResponse({
    required this.paymentId,
    required this.status,
    required this.orderId,
  });

  // Simulate a fake payment success response
  static MockPaymentResponse mockPaymentSuccess(String orderId) {
    return MockPaymentResponse(
      paymentId: "mock_payment_67890",
      status: "Success",
      orderId: orderId,
    );
  }
}
