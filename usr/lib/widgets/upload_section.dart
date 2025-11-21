import 'package:flutter/material.dart';

class UploadSection extends StatelessWidget {
  const UploadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main Upload (Unlimited)
        _buildUploadBox(
          context,
          title: 'Ảnh Nguồn (Không giới hạn)',
          subtitle: 'Tải lên ảnh cưới, sinh nhật, sự kiện...',
          icon: Icons.add_photo_alternate_outlined,
          isPrimary: true,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            // Model Upload
            Expanded(
              child: _buildUploadBox(
                context,
                title: 'Ảnh Người Mẫu',
                subtitle: 'Giữ khuôn mặt',
                icon: Icons.face,
                isPrimary: false,
              ),
            ),
            const SizedBox(width: 12),
            // Product Upload
            Expanded(
              child: _buildUploadBox(
                context,
                title: 'Ảnh Sản Phẩm',
                subtitle: 'Chèn vào thiết kế',
                icon: Icons.shopping_bag_outlined,
                isPrimary: false,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUploadBox(BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isPrimary,
  }) {
    return Container(
      height: isPrimary ? 140 : 120,
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Mock upload action
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 32, color: Theme.of(context).primaryColor),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 11, color: Colors.grey[400]),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
