import 'package:fit_garages/razorpay_pseudo/model/payment_model.dart';

class MockPaymentService {
  Future<MockPaymentResponse> verifyPayment(String orderId) async {
    // Simulate a delay as if verifying a payment
    await Future.delayed(Duration(seconds: 2));
    return MockPaymentResponse.mockPaymentSuccess(orderId);
  }
}

// This above is psuedo code whereas below case would be when integrated in real case calling razorpay api
/*
class PaymentService {
  final String baseUrl = "https://api.razorpay.com/v1"
  Future<PaymentResponse> verifyPayment(String paymentId) async {
    final response = await http.get(
      Uri.parse("$baseUrl/payments/$paymentId"),
      headers: {
        "Authorization": "Basic ${base64Encode(utf8.encode('your_api_key:your_api_secret'))}",
      },
    );

    if (response.statusCode == 200) {
      return PaymentResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to verify payment");
    }
  }
}
*/