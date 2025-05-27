import 'package:flutter/material.dart';
import 'package:flutter_app/data/notifiers.dart';
import 'package:flutter_app/views/pages/home_page.dart';
import 'package:flutter_app/views/pages/profile_page.dart';
import 'package:flutter_app/views/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
        actions: [
          ValueListenableBuilder(
            valueListenable: isDarkModeNotifier,
            builder:
                (context, selectedPage, child) => IconButton(
                  icon:
                      isDarkModeNotifier.value
                          ? const Icon(Icons.dark_mode_rounded)
                          : const Icon(Icons.dark_mode_outlined),
                  onPressed: () {
                    // Toggle dark mode or theme settings
                    print('Dark mode toggled');
                    isDarkModeNotifier.value = !isDarkModeNotifier.value;
                    // Navigate to settings page or show settings dialog
                  },
                ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
