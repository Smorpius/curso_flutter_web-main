import '../controlador/note_controller.dart';
import 'package:flutter/material.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  bool isOpen = false; // Estado para abrir/cerrar la barra lateral

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Barra lateral
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isOpen ? 210 : 60,
            decoration: BoxDecoration(
              // color: Colors.white,
              border: Border(
                right: BorderSide(color: Colors.grey.shade300, width: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: IconButton(
                    icon: Icon(isOpen ? Icons.arrow_back : Icons.menu),
                    color: Colors.grey[800],
                    onPressed: () {
                      setState(() {
                        isOpen = !isOpen;
                      });

                      NoteController().getNotes();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                _buildMenuItem(
                  Icons.noise_control_off_rounded,
                  "Projects",
                ),
                _buildMenuItem(
                  Icons.stay_primary_landscape_rounded,
                  "Drafts",
                ),
                _buildMenuItem(
                  Icons.css_rounded,
                  "Shared with me",
                ),
                const Spacer(),
                _buildMenuItem(
                  Icons.settings,
                  "Settings",
                ),
              ],
            ),
          ),
          // Contenido principal
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                //arriba a abajo
                mainAxisAlignment: MainAxisAlignment.start,
                //de izquierda a derecha
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Side Hustle',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                      ),
                      Spacer(),
                      Icon(
                        //icono de un link
                        Icons.link,
                        size: 30,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Share',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20),
                      //icono de 3 puntos acostado
                      Icon(
                        Icons.more_horiz,
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para los elementos del menú
  Widget _buildMenuItem(IconData icon, String title) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: isOpen ? 210 : 60,
          child: Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Icon(icon, color: Colors.grey[800], size: 24),
              ),
              if (isOpen) ...[
                const SizedBox(width: 10), // Espacio entre icono y texto
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
