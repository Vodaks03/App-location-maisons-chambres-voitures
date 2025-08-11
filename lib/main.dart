import 'package:flutter/material.dart';
import 'pages/Acceuil.dart';
import 'pages/Liste.dart';
import 'pages/Discussion.dart';
import 'pages/Profil.dart';

void main() {
  runApp(const MaterialApp(home: HomePage()));
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
      appBar: AppBar(
        title: Text("Bienvenue dans Makam"),
        centerTitle: true,
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
