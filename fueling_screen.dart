import 'package:fleetcare_eld/screens/main_shell.dart';
import 'package:flutter/material.dart';

class FuelingScreen extends StatelessWidget {
  const FuelingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        title: const Text("Fueling"),
        leading: const BackButton(),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔹 Top Stats
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _Stat("35000", "km"),
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xFFEAF6FF),
                    child: Icon(Icons.local_shipping,
                        color: Color(0xFF2AA6DF)),
                  ),
                  _Stat("800", "Avg"),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 Fueling List
            Expanded(
              child: ListView(
                children: const [
                  _FuelTile(),
                  _FuelTile(),
                  _FuelTile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  const _Stat(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700)),
        Text(label,
            style:
                const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }
}

class _FuelTile extends StatelessWidget {
  const _FuelTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("55000 INR",
              style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 4),
          Text(
            "OCT 8 • 09:08 PM • Kalupur Station",
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
