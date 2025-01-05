import 'package:flutter/material.dart';

class PaymentOptionScreen extends StatelessWidget {
  final String orderId;
  final Function(String, String) onSimulatePayment;

  const PaymentOptionScreen({
    required this.orderId,
    required this.onSimulatePayment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Payment Option"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildOrderDetail(),
              SizedBox(height: 30),
              _buildPaymentHeader(),
              SizedBox(height: 20),
              _paymentOption(context, "Google Pay", Icons.payments),
              _paymentOption(context, "PhonePe", Icons.mobile_friendly),
              _paymentOption(context, "Debit Card", Icons.credit_card),
              SizedBox(height: 30),
              _buildInfoSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderDetail() {
    return Column(
      children: [
        Text(
          "Order ID: $orderId",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 10),
        Text(
          "Booking a ride with FitGarage? Pay using any of the following options:",
          style: TextStyle(fontSize: 18, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPaymentHeader() {
    return Text(
      "Select Payment Method",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurpleAccent,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _paymentOption(BuildContext context, String method, IconData icon) {
    final TextEditingController detailsController = TextEditingController();

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        leading: Icon(icon, color: Colors.deepPurpleAccent, size: 30),
        title: Text(method,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Enter $method Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              content: TextField(
                controller: detailsController,
                decoration: InputDecoration(
                  labelText: "$method Details",
                  prefixIcon:
                      Icon(Icons.credit_card, color: Colors.deepPurpleAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel",
                      style: TextStyle(color: Colors.deepPurpleAccent)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onSimulatePayment(method, detailsController.text);
                  },
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      children: [
        Divider(color: Colors.grey[300], thickness: 1),
        SizedBox(height: 10),
        Text(
          "Why Choose FitGarage Payment Options?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "✔ Secure payments through trusted platforms.\n"
          "✔ Multiple payment methods to choose from.\n"
          "✔ Hassle-free booking and immediate confirmation.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Your convenience and security are our top priority.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
