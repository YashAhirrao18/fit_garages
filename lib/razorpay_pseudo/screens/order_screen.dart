import 'package:flutter/material.dart';

class OrderCreationScreen extends StatelessWidget {
  final TextEditingController amountController;
  final TextEditingController currencyController;
  final TextEditingController descriptionController;
  final VoidCallback onCreateOrder;

  const OrderCreationScreen({
    required this.amountController,
    required this.currencyController,
    required this.descriptionController,
    required this.onCreateOrder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FitGarage Rental Booking"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                "Book Your Ride with FitGarage",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Hassle-free repairs at your fingertips. Choose your ride and hit the road!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 30),
              _buildTextField(
                controller: amountController,
                label: "Booking Amount (e.g., 1500)",
                icon: Icons.attach_money,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: currencyController,
                label: "Currency (e.g., INR)",
                icon: Icons.currency_exchange,
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: descriptionController,
                label: "Vehicle Type (e.g., Sedan, SUV)",
                icon: Icons.directions_car,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: onCreateOrder,
                child: Text("Book Now"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildInfoSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.deepPurpleAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.deepPurpleAccent),
        ),
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      children: [
        Divider(color: Colors.grey[300], thickness: 1),
        SizedBox(height: 10),
        Text(
          "Why Choose FitGarage?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "✔ Wide range of vehicles: From hatchbacks to luxury SUVs.\n"
          "✔ Affordable rates and flexible rental plans.\n"
          "✔ Seamless booking experience with 24/7 support.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Experience comfort, convenience, and reliability with every ride.",
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
