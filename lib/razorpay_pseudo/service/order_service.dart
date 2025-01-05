import 'package:fit_garages/razorpay_pseudo/model/order_model.dart';

class MockOrderService {
  Future<MockRazorpayOrder> createOrder(int amount, String currency) async {
    // Simulate a delay as if calling an API
    await Future.delayed(Duration(seconds: 2));
    return MockRazorpayOrder.createMockOrder();
  }
}
// This above is psuedo code whereas below case would be when integrated in real case calling razorpay api

/* class OrderService {
  final String baseUrl = "https://api.razorpay.com/v1";

  Future<RazorpayOrder> createOrder(int amount, String currency) async {
    final response = await http.post(
      Uri.parse("$baseUrl/orders"),
      headers: {
        "Authorization": "Basic ${base64Encode(utf8.encode('your_api_key:your_api_secret'))}",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "amount": amount, // Amount in paise
        "currency": currency,
        "receipt": "order_receipt_001",
        "payment_capture": 1,
      }),
    );

    if (response.statusCode == 200) {
      return RazorpayOrder.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create Razorpay order");
    }
  }
}
*/
