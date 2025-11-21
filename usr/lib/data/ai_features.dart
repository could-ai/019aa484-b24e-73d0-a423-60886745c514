class AiFeature {
  final String name;
  final String description;
  bool isEnabled;
  final String iconAsset; // Placeholder for icon logic

  AiFeature({
    required this.name,
    required this.description,
    this.isEnabled = true,
    this.iconAsset = '',
  });
}

List<AiFeature> getInitialFeatures() {
  return [
    AiFeature(name: 'Nhận diện chủ đề', description: 'Tự động phân tích ảnh'),
    AiFeature(name: 'Gợi ý phong cách', description: 'Phù hợp sự kiện'),
    AiFeature(name: 'Cân bằng màu', description: 'Tối ưu màu sắc'),
    AiFeature(name: 'Tăng độ nét', description: 'Giữ nguyên mặt'),
    AiFeature(name: 'Chỉnh sáng tối', description: 'Tự động exposure'),
    AiFeature(name: 'Filter sự kiện', description: 'Tết, Giáng sinh...'),
    AiFeature(name: 'Cắt khung chuẩn', description: 'FB, TikTok, YT'),
    AiFeature(name: 'Thay nền', description: 'Theo chủ đề chọn'),
    AiFeature(name: 'Làm đẹp mặt', description: 'Giữ nét đặc trưng'),
    AiFeature(name: 'Bố cục thông minh', description: 'Sắp xếp hợp lý'),
    AiFeature(name: 'Upscale 8K', description: 'Siêu phân giải'),
    AiFeature(name: 'Chèn thông điệp', description: 'Text nghệ thuật'),
    AiFeature(name: 'Album Collage', description: 'Ghép nhiều ảnh'),
    AiFeature(name: 'Xóa vật thể', description: 'Xóa rác ảnh'),
    AiFeature(name: 'Ảnh quảng cáo', description: 'Chuẩn thương mại'),
    AiFeature(name: 'Caption gợi ý', description: 'Viết status'),
    AiFeature(name: 'Màu theo ngành', description: 'Branding color'),
    AiFeature(name: 'Lưu ảnh gốc', description: 'Backup riêng'),
    AiFeature(name: 'Phục hồi bản cũ', description: 'Undo không mất'),
    AiFeature(name: 'Đa phiên bản', description: 'Tạo nhiều option'),
  ];
}
