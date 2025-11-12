import 'package:flutter/material.dart';
import 'package:at_91_f/services/post_service.dart';
import 'package:at_91_f/utils/colors.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _contentController = TextEditingController();
  bool _isLoading = false;
  String? _error;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _submitPost() async {
    final content = _contentController.text.trim();

    if (content.isEmpty) {
      setState(() => _error = 'Por favor escribe algo');
      return;
    }

    if (content.length > 300) {
      setState(() => _error = 'El post no puede exceder 300 caracteres');
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Crear el post usando el servicio
      // TODO: obtener datos del usuario autenticado (userName y avatarUrl)
      await PostService.createPost(
        userName: 'Usuario Actual', // Reemplazar con datos reales del usuario
        avatarUrl: 'https://i.pravatar.cc/150?img=70',
        content: content,
      );

      if (mounted) {
        // Limpiar el campo
        _contentController.clear();
        setState(() {
          _error = null;
          _isLoading = false;
        });

        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('¡Post creado exitosamente!')),
        );

        // Navegar a home para ver el post creado
        // (opcional: aquí podrías simplemente actualizar la UI localmente)
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString().replaceFirst('Exception: ', '');
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final charCount = _contentController.text.length;
    final charLimit = 300;
    final remaining = charLimit - charCount;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crear Post',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Área de texto para el contenido
              Card(
                elevation: 0,
                color: AppColors.cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _contentController,
                    maxLength: 300,
                    maxLines: 8,
                    minLines: 5,
                    decoration: InputDecoration(
                      hintText: '¿Qué está en tu mente?',
                      hintStyle: TextStyle(
                        color: AppColors.textColor.withOpacity(0.5),
                      ),
                      border: InputBorder.none,
                      counterText: '', // Ocultamos el contador predeterminado
                    ),
                    style: const TextStyle(color: AppColors.textColor),
                    onChanged: (value) {
                      setState(
                        () {}, // Actualizar para mostrar el contador
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Contador de caracteres
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$charCount / $charLimit caracteres',
                    style: TextStyle(
                      color:
                          remaining < 50
                              ? Colors.orange
                              : remaining < 0
                              ? Colors.red
                              : AppColors.textColor.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                  if (remaining < 0)
                    const Text(
                      'Límite excedido',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),

              // Mostrar error si existe
              if (_error != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.2),
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),

              // Botón para enviar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      _isLoading || charCount == 0 || charCount > 300
                          ? null
                          : _submitPost,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child:
                      _isLoading
                          ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                          : const Text(
                            'Publicar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
