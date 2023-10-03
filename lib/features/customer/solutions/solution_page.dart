import 'package:flutter/material.dart';

class SolutionPage extends StatefulWidget {
  const SolutionPage({super.key});

  @override
  State<SolutionPage> createState() => _SolutionPageState();
}

class _SolutionPageState extends State<SolutionPage> {
  late TextEditingController _answerController;

  @override
  void initState() {
    super.initState();
    _answerController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _answerController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}