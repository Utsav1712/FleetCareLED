import 'package:fleetcare_eld/screens/main_shell.dart';
import 'package:flutter/material.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F9FD),

        appBar: AppBar(
          backgroundColor: const Color(0xFF2AA6DF),
          title: const Text("Routes"),
          leading: const BackButton(),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Past"),
              Tab(text: "Today"),
              Tab(text: "Future"),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            _EmptyRoutes(
              title: "No Past Routes",
              subtitle: "No routes found in your past history",
            ),
            _EmptyRoutes(
              title: "No Routes for Today",
              subtitle: "There are no routes scheduled for today",
            ),
            _EmptyRoutes(
              title: "No Future Routes",
              subtitle: "No routes scheduled for future",
            ),
          ],
        ),

        bottomNavigationBar: const MainShell(),
      ),
    );
  }
}

class _EmptyRoutes extends StatelessWidget {
  final String title;
  final String subtitle;

  const _EmptyRoutes({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFFEAF6FF),
            child: Icon(Icons.alt_route, size: 36, color: Color(0xFF2AA6DF)),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.black54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
