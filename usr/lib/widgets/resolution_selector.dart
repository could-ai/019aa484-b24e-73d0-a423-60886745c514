import 'package:flutter/material.dart';

class ResolutionSelector extends StatelessWidget {
  final String selectedResolution;
  final Function(String) onChanged;

  const ResolutionSelector({
    super.key,
    required this.selectedResolution,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final resolutions = ['1k', '2k', '4k', '6k', '8k'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedResolution,
          isExpanded: true,
          dropdownColor: const Color(0xFF2C2C2C),
          icon: const Icon(Icons.hd, color: Colors.white),
          items: resolutions.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                'Độ phân giải: $value',
                style: const TextStyle(color: Colors.white),
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
