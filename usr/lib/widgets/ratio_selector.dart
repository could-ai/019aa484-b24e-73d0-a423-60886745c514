import 'package:flutter/material.dart';

class RatioSelector extends StatelessWidget {
  final String selectedRatio;
  final Function(String) onChanged;

  const RatioSelector({
    super.key,
    required this.selectedRatio,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final ratios = [
      {'name': 'Facebook', 'icon': Icons.facebook},
      {'name': 'Instagram', 'icon': Icons.camera_alt},
      {'name': 'TikTok', 'icon': Icons.music_note},
      {'name': 'YouTube', 'icon': Icons.play_circle_fill},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedRatio,
          isExpanded: true,
          dropdownColor: const Color(0xFF2C2C2C),
          icon: const Icon(Icons.aspect_ratio, color: Colors.white),
          items: ratios.map((Map<String, dynamic> item) {
            return DropdownMenuItem<String>(
              value: item['name'] as String,
              child: Row(
                children: [
                  Icon(item['icon'] as IconData, size: 16, color: Colors.white70),
                  const SizedBox(width: 8),
                  Text(
                    item['name'] as String,
                    style: const TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (val) {
            if (val != null) onChanged(val);
          },
        ),
      ),
    );
  }
}
