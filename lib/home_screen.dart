// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  double _bmi = 0;
  String _category = '';

  void _calculateBMI() {
    final weight = double.parse(_weightController.text);
    final height =
        double.parse(_heightController.text) / 100; // Convert cm to meters
    setState(() {
      _bmi = weight / (height * height);
      if (_bmi < 18.5) {
        _category = 'kurang berat badan';
      } else if (_bmi < 25) {
        _category = 'Normal';
      } else {
        _category = 'kelebihan berat badan';
      }
    });
  }

  Color _getCategoryColor() {
    if (_category == 'Underweight') {
      return Colors.red; // or Colors.yellow based on your class
    } else if (_category ==
        'Underweight = red, Normal = Green, Overweight = yellow') {
      return Colors.green;
    } else {
      return Colors.yellow; // or Colors.red based on your class
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _weightController,
                decoration: InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _heightController,
                decoration: InputDecoration(labelText: 'Height (cm)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateBMI,
                child: Text('Calculate BMI'),
              ),
              SizedBox(height: 20),
              Text(
                'BMI: ${_bmi.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Category: $_category',
                style: TextStyle(fontSize: 24, color: _getCategoryColor()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
