import 'package:fit_garages/razorpay_pseudo/model/order_model.dart';
import 'package:fit_garages/razorpay_pseudo/service/order_service.dart';

class MockOrderController {
  final MockOrderService _orderService = MockOrderService();

  Future<MockRazorpayOrder> createOrder(int amount, String currency) async {
    return await _orderService.createOrder(amount, currency);
  }
}
