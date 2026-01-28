import 'package:fleetcare_eld/screens/assignment/nter_shipping_id_screen.dart';
import 'package:fleetcare_eld/screens/home/hos/edit_log_screen.dart';
import 'package:fleetcare_eld/screens/main_shell.dart';
import 'package:flutter/material.dart';
import 'package:fleetcare_eld/screens/assignment/enter_trailer_screen.dart';

class DailyLogScreen extends StatelessWidget {
  const DailyLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      // 🔹 APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        elevation: 0,
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

      // 🔹 BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 📅 DATE
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

            // 📊 GRAPH
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

            // 📦 FORMS
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
                _rowItem("Shipping IDs", onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EnterShippingIdScreen(),
                    ),
                  );
                }),
              ],
            ),

            const SizedBox(height: 14),

            // 📜 LOGS (FIXED ✅)
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF6FF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [

                  // OFF DUTY LOG → EDIT LOG
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EditLogScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.power_settings_new,
                            color: Color(0xFF2AA6DF),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Off Duty",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "12:00 AM – 5h 3m",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            ),
                            Text(
                              "No Location",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 11),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.edit,
                            color: Color(0xFF2AA6DF)),
                      ],
                    ),
                  ),

                  const Divider(height: 24),

                  // ADD REMARK
                  InkWell(
                    onTap: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add Remark"),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // ⚙️ MORE
            _sectionCard(
              title: "More",
              children: const [
                _infoRow("Ruleset", "USA 70 hour / 8 day"),
                SizedBox(height: 10),
                _infoRow("Time zone", "America/New_York"),
              ],
            ),

            const SizedBox(height: 18),

            // ✅ CERTIFY
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

            const SizedBox(height: 16),
          ],
        ),
      ),

    
    );
  }

  // 🔹 HELPERS
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

class _infoRow extends StatelessWidget {
  final String left;
  final String right;

  const _infoRow(this.left, this.right);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left),
        Text(right, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}
