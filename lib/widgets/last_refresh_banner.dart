import 'package:flutter/material.dart';

class LastRefreshBanner extends StatelessWidget {
  const LastRefreshBanner({
    super.key,
    required this.label,
    required this.isStale,
    required this.isRefreshing,
  });

  final String label;
  final bool isStale;
  final bool isRefreshing;

  @override
  Widget build(BuildContext context) {
    final color = isStale ? Colors.orange.shade800 : null;
    return Column(
      children: [
        if (isRefreshing) const LinearProgressIndicator(),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isStale) Icon(Icons.warning_amber, size: 18, color: color),
              if (isStale) const SizedBox(width: 4),
              Text(
                isRefreshing
                    ? 'Actualisation en cours…'
                    : isStale
                    ? '$label (données anciennes)'
                    : label,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
