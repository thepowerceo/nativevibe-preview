/// Represents a single hairstyle service offered by the salon.
class HairstyleService {
  final String id;
  final String name;
  final double price;
  final int durationInMinutes;
  final String imageUrl; // Placeholder for a real image URL

  const HairstyleService({
    required this.id,
    required this.name,
    required this.price,
    required this.durationInMinutes,
    required this.imageUrl,
  });
}