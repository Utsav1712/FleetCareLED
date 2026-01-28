import 'package:fleetcare_eld/screens/home/hos/edit_log_screen.dart';
import 'package:fleetcare_eld/screens/main_shell.dart';
import 'package:flutter/material.dart';
import 'package:fleetcare_eld/screens/assignment/enter_trailer_screen.dart';
import 'package:fleetcare_eld/screens/home/shipping/add_shipping_id_screen.dart';

class DailyLogScreen extends StatefulWidget {
  const DailyLogScreen({super.key});

  @override
  State<DailyLogScreen> createState() => _DailyLogScreenState();
}

class _DailyLogScreenState extends State<DailyLogScreen> {
  List<String> shippingIds = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        title: const Text("Daily Log"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Icon(Icons.edit),
          SizedBox(width: 12),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // DATE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _navArrow(Icons.chevron_left),
                const Text(
                  "Sunday, Oct 19th, 2025",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                _navArrow(Icons.chevron_right),
              ],
            ),

            const SizedBox(height: 12),

            // GRAPH
            Container(
              padding: const EdgeInsets.all(12),
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
              child: Image.asset(
                'assets/images/daily_log_graph.png',
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 16),

            // FORMS
            _sectionCard(
              title: "Forms",
              children: [
                _rowItem("Trailer", onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EnterTrailerScreen(),
                    ),
                  );
                }),
                _divider(),
                _rowItem("Shipping IDs", onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddShippingIdScreen(),
                    ),
                  );

                  if (result != null && result is String) {
                    setState(() {
                      shippingIds.add(result);
                    });
                  }
                }),
              ],
            ),

            const SizedBox(height: 14),

            // SHOW SAVED SHIPPING IDS
            if (shippingIds.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Shipping IDs",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    ...shippingIds.map(
                      (id) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(id),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 14),

            // LOGS
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF6FF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EditLogScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.power_settings_new,
                            color: Color(0xFF2AA6DF),
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Off Duty",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            Text(
                              "12:00 AM – 5h 3m",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.edit, color: Color(0xFF2AA6DF)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // CERTIFY
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2AA6DF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: const Text("Certify and Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // HELPERS
  Widget _navArrow(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, size: 20),
    );
  }

  Widget _sectionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF6FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  Widget _rowItem(String text, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Divider(height: 1),
    );
  }
}
