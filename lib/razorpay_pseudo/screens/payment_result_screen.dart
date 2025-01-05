import 'package:flutter/material.dart';

class PaymentResultScreen extends StatelessWidget {
  final bool paymentSuccess;
  final String paymentStatus;
  final VoidCallback onMakeAnotherPayment;

  const PaymentResultScreen({
    required this.paymentSuccess,
    required this.paymentStatus,
    required this.onMakeAnotherPayment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Result"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIcon(),
              SizedBox(height: 20),
              _buildResultText(),
              SizedBox(height: 20),
              _buildPaymentStatus(),
              SizedBox(height: 30),
              _buildNextStepButton(context),
              SizedBox(height: 30),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(
      paymentSuccess ? Icons.check_circle : Icons.error,
      color: paymentSuccess ? Colors.green : Colors.red,
      size: 100,
    );
  }

  Widget _buildResultText() {
    return Text(
      paymentSuccess ? "Payment Successful!" : "Payment Failed!",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: paymentSuccess ? Colors.green : Colors.red,
      ),
    );
  }

  Widget _buildPaymentStatus() {
    return Text(
      paymentStatus,
      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildNextStepButton(BuildContext context) {
    return ElevatedButton(
      onPressed: onMakeAnotherPayment,
      child: Text("Make Another Payment"),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        textStyle: TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Divider(color: Colors.grey[300], thickness: 1),
        SizedBox(height: 10),
        Text(
          "FitGarage - Your Trusted Ride Rental Partner",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          "We are here to provide you with the best vehicle rental experience. Secure payments and fast bookings!",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
