import 'package:flutter/material.dart';
import '../data/ai_features.dart';
import '../widgets/upload_section.dart';
import '../widgets/feature_toggle_grid.dart';
import '../widgets/resolution_selector.dart';
import '../widgets/ratio_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State variables
  String _selectedResolution = '4k';
  String _selectedRatio = 'Instagram';
  final TextEditingController _promptController = TextEditingController();
  
  // Manage state of 20 features
  late List<AiFeature> _features;

  @override
  void initState() {
    super.initState();
    _features = getInitialFeatures();
  }

  void _toggleFeature(int index) {
    setState(() {
      _features[index].isEnabled = !_features[index].isEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trợ Lý AI Thiết Kế', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.history), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Upload Section
            const Text('1. Tải lên dữ liệu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 12),
            const UploadSection(),
            
            const SizedBox(height: 24),
            
            // 2. Settings (Resolution & Ratio)
            const Text('2. Cấu hình đầu ra', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ResolutionSelector(
                    selectedResolution: _selectedResolution,
                    onChanged: (val) => setState(() => _selectedResolution = val),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: RatioSelector(
                    selectedRatio: _selectedRatio,
                    onChanged: (val) => setState(() => _selectedRatio = val),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 3. Prompt Input
            const Text('3. Mô tả ý tưởng (Tiếng Việt)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 12),
            TextField(
              controller: _promptController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Ví dụ: Thiết kế ảnh cưới phong cách Hàn Quốc, lãng mạn, tone màu pastel...',
                prefixIcon: Icon(Icons.auto_awesome, color: Colors.purpleAccent),
              ),
            ),

            const SizedBox(height: 24),

            // 4. 20 Auto Features
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('4. Tính năng tự động (20)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                TextButton(
                  onPressed: () {
                    setState(() {
                      for (var f in _features) {
                        f.isEnabled = true;
                      }
                    });
                  },
                  child: const Text('Bật tất cả'),
                )
              ],
            ),
            const SizedBox(height: 8),
            FeatureToggleGrid(features: _features, onToggle: _toggleFeature),

            const SizedBox(height: 32),

            // 5. Generate Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Đang khởi tạo AI... Xử lý hình ảnh...'),
                      backgroundColor: Colors.purpleAccent,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 8,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.auto_awesome),
                    SizedBox(width: 12),
                    Text('BẮT ĐẦU THIẾT KẾ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
