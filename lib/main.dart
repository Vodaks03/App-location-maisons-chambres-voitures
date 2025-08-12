import 'package:flutter/material.dart';
import 'pages/Acceuil.dart';
import 'pages/Liste.dart';
import 'pages/Discussion.dart';
import 'pages/Profil.dart';

void main() {
  runApp(
    const MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final pages = [AcceuilPage(), ListePage(), DiscussionPage(), ProfilPage()];

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/image/home.jpg', fit: BoxFit.cover),
          ),
          pages[pageIndex],
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 207, 140, 219),
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Acceuil'),
              onTap: () {
                setState(() {
                  pageIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Liste'),
              onTap: () {
                setState(() {
                  pageIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Discussion'),
              onTap: () {
                setState(() {
                  pageIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                setState(() {
                  pageIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Paramètres'),
              onTap: () {
                // Action pour les paramètres
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Déconnexion'),
              onTap: () {
                // Action pour la déconnexion
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("MaKam"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Action pour le bouton de recherche
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Action pour le bouton plus
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 207, 140, 219),
      ),

      // barre de navigation en dessous de la page
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Acceuil"),
          NavigationDestination(icon: Icon(Icons.list), label: "Liste"),
          NavigationDestination(icon: Icon(Icons.message), label: "Discussion"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profil"),
        ],
        selectedIndex: pageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_a_photo_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
