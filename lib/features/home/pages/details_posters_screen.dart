
import 'package:flutter/material.dart';

class DetailsPostersScreen extends StatefulWidget {
  static const routeName = '/details-posters-screen';
  final String idPoster;
  const DetailsPostersScreen({required this.idPoster,super.key});

  @override
  State<DetailsPostersScreen> createState() => _DetailsPostersScreenState();
}

class _DetailsPostersScreenState extends State<DetailsPostersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
