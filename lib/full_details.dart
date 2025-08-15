import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'functions.dart';

class FullDetails extends StatelessWidget {
  const FullDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = Get.arguments as List<List<String>>;
    final metro = Metro();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Routes',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        backgroundColor: const Color(0xFFc41014),
      ),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, i) {
          final route = routes[i];
          final title = 'Route ${i + 1}';

          // Build segment directions:
          final directions = <String>[];
          int segStart = 0;

          for (int idx = 0; idx < route.length - 1; idx++) {
            final cur = route[idx];
            final next = route[idx + 1];

            // Lines of current segment so far, and the next hop:
            final lineBefore = metro.getCommonLine(route[segStart], cur);
            final lineAfter = metro.getCommonLine(cur, next);

            // If either is empty, we can't make a decision; skip until we have a valid pair.
            if (lineBefore.isEmpty || lineAfter.isEmpty) continue;

            // A real line change only if line references differ (or contents differ).
            final changed =
                !identical(lineBefore, lineAfter) &&
                !(lineBefore.length == lineAfter.length &&
                    List<String>.from(lineBefore).join('|') ==
                        List<String>.from(lineAfter).join('|'));

            if (changed) {
              final dir = metro.tryGetDirection(route[segStart], cur);
              if (dir != null && segStart != idx) {
                directions.add('${route[segStart]} → $dir');
                segStart = idx; // start next segment at the interchange station
              }
            }
          }

          // Close the final segment
          final lastDir = metro.tryGetDirection(route[segStart], route.last);
          if (lastDir != null) {
            directions.add('${route[segStart]} → $lastDir');
          }

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ExpansionTile(
              title: Text(title),
              subtitle: Text(
                '${route.length} stops • ${metro.expectedTimeMin(route)} min • ${metro.fareEGP(route)} EGP',
              ),
              childrenPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              children: [
                // Stations list
                ...List.generate(
                  route.length,
                  (idx) => ListTile(
                    leading: Text((idx + 1).toString().padLeft(2, '0')),
                    title: Text(route[idx]),
                    dense: true,
                  ),
                ),
                const Divider(),

                // Only show "Directions" section if there is at least one (i.e., at least one segment)
                if (directions.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Directions',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 6),
                        ...directions.map(
                          (d) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              '• $d',
                              style: TextStyle(color: Color(0xFFc41014)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
