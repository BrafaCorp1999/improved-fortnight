import 'package:flutter/material.dart';
import 'package:wink/core/utils/constants/colors.dart';

class AIResultView extends StatelessWidget {
  final String recommendation;
  final List<String> imageUrls;

  const AIResultView({
    super.key,
    required this.recommendation,
    required this.imageUrls,
  });
  final Color lightFrenchBeige = const Color(0xFFD0A583); // Fondo principal
final Color bittersweetShimmer = const Color(0xFFBA4353); // Encabezados y elementos destacados
final Color oliveDrabCamouflage = const Color(0xFF54E34); // Botones principales (marrón)
final Color citron = const Color(0xFFAD9F22); // Color secundario/acentos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 252, 246),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(100, 158, 143, 47),
        foregroundColor: TColors.black,
        title: const Text("Outfit Sugerido por la IA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              recommendation,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: imageUrls.map((url) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                      height: 230,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.broken_image, size: 100);
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 8,),
            Text("Enlaces a las tiendas:"),
            SizedBox(height: 4,),
            Text("-https://www.amazon.es/Mayoii-Blusas-blusas-verano-celeste/",style: TextStyle(color: Colors.blue),),
            SizedBox(height: 8,),
            Text("-https://www.amazon.es/Build-Your-Brand-extendidos-Oceanblue/",style: TextStyle(color: Colors.blue),),

          ],
        ),
      ),
    );
  }
}