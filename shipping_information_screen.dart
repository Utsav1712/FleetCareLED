import 'package:flutter/material.dart';

class ShippingInformationScreen extends StatelessWidget {
  final String shippingId;

  const ShippingInformationScreen({
    super.key,
    required this.shippingId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      // 🔹 APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        elevation: 0,
        title: const Text("Shipping Information"),
        leading: const BackButton(),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔹 SHOW SHIPPING ID (PASSED VALUE)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF6FF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                "Shipping ID: $shippingId",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 LIST
            Expanded(
              child: ListView(
                children: const [
                  _ShippingCard(
                    city: "Mumbai",
                    meet: "Meet - Prince",
                  ),
                  _ShippingCard(
                    city: "Punjab",
                    meet: "Meet - Prince",
                  ),
                  _ShippingCard(
                    city: "Chennai",
                    meet: "Meet - Prince",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShippingCard extends StatelessWidget {
  final String city;
  final String meet;

  const _ShippingCard({
    required this.city,
    required this.meet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🔹 TOP ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                city,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CircleAvatar(
                radius: 14,
                backgroundColor: const Color(0xFFEAF6FF),
                child: Icon(
                  Icons.radio_button_checked,
                  size: 16,
                  color: const Color(0xFF2AA6DF),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Text(
            meet,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Office No.323, Corporate Avenue, Sonawala Rd, near Railway Station,\nSonawala Industry Estate, Goregaon, Mumbai, Maharashtra 400063",
            style: TextStyle(fontSize: 12),
          ),

          const SizedBox(height: 10),

          // 🔹 DATES
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "25-10-2025 Start",
                style: TextStyle(fontSize: 11, color: Colors.black54),
              ),
              Text(
                "28-10-2025 Driver",
                style: TextStyle(fontSize: 11, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
