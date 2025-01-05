import 'package:fit_garages/razorpay_pseudo/model/payment_model.dart';
import 'package:fit_garages/razorpay_pseudo/service/payment_service.dart';

class MockPaymentController {
  final MockPaymentService _paymentService = MockPaymentService();

  Future<MockPaymentResponse> verifyPayment(String orderId) async {
    return await _paymentService.verifyPayment(orderId);
  }
}
