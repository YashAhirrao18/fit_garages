import 'package:fit_garages/razorpay_pseudo/model/payment_model.dart';

class MockPaymentService {
  Future<MockPaymentResponse> verifyPayment(String orderId) async {
    // Simulate a delay as if verifying a payment
    await Future.delayed(Duration(seconds: 2));
    return MockPaymentResponse.mockPaymentSuccess(orderId);
  }
}
