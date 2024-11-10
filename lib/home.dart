import 'package:flutter/material.dart';
import 'package:login/provider/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
          future: homeProvider.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.email),
                    Text(snapshot.data!.id),
                    Text(snapshot.data!.name),
                  ],
                ),
              );
            }else {
              return const Center(child: CircularProgressIndicator(),);
            }
          }),
    );
  }
}
