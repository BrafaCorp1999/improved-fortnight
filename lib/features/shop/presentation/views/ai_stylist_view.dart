import 'package:flutter/material.dart';
import 'package:wink/core/utils/constants/colors.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/features/shop/presentation/views/ai_result_view.dart';
import 'package:wink/services/gemini_service.dart';
import 'package:wink/services/unsplash_service.dart';

class AIStylistView extends StatefulWidget {
  const AIStylistView({super.key});

  @override
  State<AIStylistView> createState() => _AIStylistViewState();
}

class _AIStylistViewState extends State<AIStylistView> {
  final Color babyPink = const Color(0xFFF5DDD8);
  final Color softGold = const Color(0xFFD4B170);
  final Color winkBlack = const Color.fromARGB(255, 176, 163, 163);
  final Color lightFrenchBeige = const Color.fromARGB(255, 248, 211, 183); // Fondo principal
final Color bittersweetShimmer = const Color(0xFFBA4353); // Encabezados y elementos destacados
final Color oliveDrabCamouflage = const Color.fromARGB(100, 158, 143, 47);// Botones principales (marrón)
final Color citron = const Color(0xFFAD9F22); // Color secundario/acentos
final Color od = const Color.fromARGB(10, 85, 73, 64);
final Color crema = const Color.fromARGB(1, 253, 252, 246);
final Color crema2 = Color.fromARGB(0, 233, 218, 182);

  String? occasion;
  String? style;
  String? climate;
  List<String> selectedColors = [];
  String? otherStyle;

  final TextEditingController _otherStyleController = TextEditingController();
  final TextEditingController _otherOccasionController = TextEditingController();

  final List<String> colorOptions = [
    'blanco', 'negro', 'rojo', 'azul', 'verde', 
    'amarillo', 'beige', 'gris', 'rosado', 'marrón'
  ];

  void submit() async {
    if (occasion == null || style == null || climate == null) return;

    final colorPreference = selectedColors.isNotEmpty 
      ? selectedColors.join(', ') 
      : "cualquiera";

    final prompt = "Sugiere un outfit para una ocasión '$occasion', con estilo '${style == "Otro" ? otherStyle : style}', en clima '$climate'. Preferencia de colores: $colorPreference. Máximo de 3-4 líneas resumido";

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final outfitText = await GeminiService.getOutfitRecommendation(prompt);
      final images = await UnsplashService.searchImages(
        style: style!,
        occasion: occasion!,
        climate: climate!,
        colorPreference: colorPreference,
      );

      if (mounted) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AIResultView(
              recommendation: outfitText,
              imageUrls: images,
            ),
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Error"),
          content: Text("Ocurrió un error: $e"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cerrar"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 252, 246),
      appBar: AppBar(
        title: const Text("AI Stylist"),
        backgroundColor: Color.fromARGB(100, 158, 143, 47),
       
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ocasión
            _buildQuestionSection(
              title: "¿Para qué ocasión es el outfit?",
              options: ["Casual", "Fiesta", "Trabajo", "Cena", "Otro"],
              selectedValue: occasion,
              onChanged: (value) {
                if (value == "Otro") {
                  _showCustomInputDialog(
                    context: context,
                    title: "Especifica la ocasión",
                    controller: _otherOccasionController,
                    onSave: () {
                      setState(() {
                        occasion = _otherOccasionController.text;
                      });
                    },
                  );
                } else {
                  setState(() => occasion = value);
                }
              },
            ),

            const SizedBox(height: 10),

            // Estilo
            _buildQuestionSection(
              title: "¿Qué estilo prefieres?",
              options: ["Urbano", "Elegante", "Minimalista", "Streetwear", "Otro"],
              selectedValue: style,
              onChanged: (value) {
                if (value == "Otro") {
                  _showCustomInputDialog(
                    context: context,
                    title: "Especifica tu estilo",
                    controller: _otherStyleController,
                    onSave: () {
                      setState(() {
                        style = "Otro";
                        otherStyle = _otherStyleController.text;
                      });
                    },
                  );
                } else {
                  setState(() => style = value);
                }
              },
            ),

            const SizedBox(height: 10),

            // Clima
            _buildQuestionSection(
              title: "¿Cómo está el clima?",
              options: ["Frío", "Templado", "Cálido"],
              selectedValue: climate,
              onChanged: (value) => setState(() => climate = value),
            ),

            const SizedBox(height: 10),

            // Colores
            const Text(
              "¿Colores preferidos?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildColorSelection(),

            const SizedBox(height: 10),

            // Botón de enviar
            Center(
              child: ElevatedButton(
                onPressed: submit,
                style: ElevatedButton.styleFrom(
                  
                  backgroundColor: Color.fromARGB(100, 158, 143, 47),
                  foregroundColor: Color.fromARGB(100, 158, 143, 47),
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text("Generar outfit", style: TextStyle(color: Colors.black),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionSection({
    required String title,
    required List<String> options,
    required String? selectedValue,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) {
            return ChoiceChip(
              label: Text(option),
              selected: selectedValue == option,
              onSelected: (selected) => onChanged(selected ? option : null),
              selectedColor: Color.fromARGB(100, 158, 143, 47),
              backgroundColor: Color.fromARGB(255, 253, 252, 246),
              labelStyle: TextStyle(
                color: selectedValue == option ? Colors.black : Colors.black87,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildColorSelection() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: colorOptions.map((color) {
        final isSelected = selectedColors.contains(color);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedColors.remove(color);
              } else {
                selectedColors.add(color);
              }
            });
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _getColorFromName(color),
              shape: BoxShape.circle,
              border: 
              Border.all(color: Colors.black, width: 2)
            ),
            child: isSelected
              ? const Icon(Icons.check, color: Color.fromARGB(255, 239, 216, 216), size: 20)
              : null,
          ),
        );
      }).toList(),
    );
  }

  Color _getColorFromName(String colorName) {
    switch (colorName) {
      case 'blanco': return Colors.white;
      case 'negro': return Colors.black;
      case 'rojo': return Colors.red;
      case 'azul': return Colors.blue;
      case 'verde': return Colors.green;
      case 'amarillo': return Colors.yellow;
      case 'beige': return const Color(0xFFF5F5DC);
      case 'gris': return Colors.grey;
      case 'rosado': return Colors.pink;
      case 'marrón': return const Color(0xFFA52A2A);
      default: return Colors.white;
    }
  }

  void _showCustomInputDialog({
    required BuildContext context,
    required String title,
    required TextEditingController controller,
    required VoidCallback onSave,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Especifica aquí..."),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              onSave();
              Navigator.pop(context);
            },
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }
}