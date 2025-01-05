import 'package:fit_garages/razorpay_pseudo/screens/order_screen.dart';
import 'package:fit_garages/razorpay_pseudo/screens/payment_option.dart';
import 'package:fit_garages/razorpay_pseudo/screens/payment_result_screen.dart';
import 'package:flutter/material.dart';

class MockPaymentDemo extends StatefulWidget {
  @override
  _MockPaymentDemoState createState() => _MockPaymentDemoState();
}

class _MockPaymentDemoState extends State<MockPaymentDemo> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _orderId = "";
  bool _paymentSuccess = false;
  String _paymentStatus = "";

  Future<void> _createOrder() async {
    // Simulate order creation
    setState(() {
      _orderId = "ORDER123";
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentOptionScreen(
          orderId: _orderId,
          onSimulatePayment: _simulatePayment,
        ),
      ),
    );
  }

  void _simulatePayment(String method, String details) {
    // Simulate payment processing
    setState(() {
      _paymentSuccess = method == "Google Pay"; // Mock success condition
      _paymentStatus = _paymentSuccess
          ? "Payment Successful via $method"
          : "Payment Failed via $method";
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentResultScreen(
          paymentSuccess: _paymentSuccess,
          paymentStatus: _paymentStatus,
          onMakeAnotherPayment: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrderCreationScreen(
      amountController: _amountController,
      currencyController: _currencyController,
      descriptionController: _descriptionController,
      onCreateOrder: _createOrder,
    );
  }
}
