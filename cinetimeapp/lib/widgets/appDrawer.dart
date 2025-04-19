import 'package:flutter/material.dart';
import 'package:cinetimeapp/screen/movieListScreen.dart';
import 'package:cinetimeapp/screen/ticketlistScreen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Abc"),
            accountEmail: Text("abc@xyz.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.grey[700]),
            ),
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
          DrawerTile(
            icon: Icons.home,
            label: "Home",
            onTap: () {
              Navigator.pop(context);
              // Navigation logic (if needed)
            },
          ),
          DrawerTile(
            icon: Icons.movie,
            label: "Movies",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => MovieListScreen()),
              );
            },
          ),
          DrawerTile(
            icon: Icons.theaters,
            label: "Theaters",
            onTap: () {
              Navigator.pop(context); // Add navigation later
            },
          ),
          DrawerTile(
            icon: Icons.confirmation_number,
            label: "My Tickets",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MyTicketsScreen()),
              );
            },
          ),
          DrawerTile(
            icon: Icons.settings,
            label: "Settings",
            onTap: () {
              Navigator.pop(context); // Add navigation later
            },
          ),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const DrawerTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[800]),
      title: Text(label),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
