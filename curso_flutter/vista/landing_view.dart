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
      appBar: AppBar(
        title: Text('Landing Page'),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        children: [
          // Barra lateral
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isOpen ? 250 : 70,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border(
                right: BorderSide(color: Colors.grey.shade300, width: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: IconButton(
                    icon: Icon(isOpen ? Icons.arrow_back : Icons.menu),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        isOpen = !isOpen;
                      });

                      NoteController().getNotes();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                if (isOpen)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                _buildMenuItem(
                  Icons.book,
                  "Projects",
                ),
                _buildMenuItem(
                  Icons.edit_note_rounded,
                  "Drafts",
                ),
                _buildMenuItem(
                  Icons.switch_access_shortcut_add_rounded,
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
          // Cuerpo principal
          Expanded(
            child: Center(
              child: Text(
                'Welcome to the Landing Page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: isOpen ? Text(title, style: TextStyle(color: Colors.white)) : null,
      onTap: () {},
    );
  }
}
