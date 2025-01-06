import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CsvJsonConverter(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CsvJsonConverter extends StatefulWidget {
  const CsvJsonConverter({super.key});

  @override
  _CsvJsonConverterState createState() => _CsvJsonConverterState();
}

class _CsvJsonConverterState extends State<CsvJsonConverter> {
  final TextEditingController _csvController = TextEditingController();
  final TextEditingController _jsonController = TextEditingController();
  final TextEditingController _csvPathController = TextEditingController();
  final TextEditingController _jsonPathController = TextEditingController();

  void _convertCsvToJson() {
    try {
      final csv = _csvController.text;
      if (csv.isEmpty) {
        _showMessage('CSV field is empty!');
        return;
      }
      final rows = csv.split('\n');
      final headers = rows.first.split(',');
      final data = rows.skip(1).map((row) {
        final values = row.split(',');
        return Map.fromIterables(headers, values);
      }).toList();
      _jsonController.text = jsonEncode(data);
    } catch (e) {
      _showMessage('Invalid CSV format!');
    }
  }

  void _convertJsonToCsv() {
    try {
      final jsonText = _jsonController.text;
      if (jsonText.isEmpty) {
        _showMessage('JSON field is empty!');
        return;
      }
      final jsonData = jsonDecode(jsonText) as List<dynamic>;
      final headers = (jsonData.first as Map<String, dynamic>).keys;
      final csv = StringBuffer();
      csv.writeln(headers.join(','));
      for (final item in jsonData) {
        csv.writeln((item as Map<String, dynamic>).values.join(','));
      }
      _csvController.text = csv.toString();
    } catch (e) {
      _showMessage('Invalid JSON format!');
    }
  }

  void _clearFields() {
    _csvController.clear();
    _jsonController.clear();
  }

  void _openCsvFile() async {
    final path = _csvPathController.text;
    if (path.isEmpty) {
      _showMessage('CSV file path is empty!');
      return;
    }
    try {
      final file = File(path);
      if (await file.exists()) {
        _csvController.text = await file.readAsString();
      } else {
        _showMessage('CSV file not found!');
      }
    } catch (e) {
      _showMessage('Error reading CSV file!');
    }
  }

  void _saveCsvFile() async {
    final path = _csvPathController.text;
    final content = _csvController.text;
    if (path.isEmpty || content.isEmpty) {
      _showMessage('CSV path or content is empty!');
      return;
    }
    try {
      final file = File(path);
      await file.writeAsString(content);
      _showMessage('CSV saved successfully!');
    } catch (e) {
      _showMessage('Error saving CSV file!');
    }
  }

  void _openJsonFile() async {
    final path = _jsonPathController.text;
    if (path.isEmpty) {
      _showMessage('JSON file path is empty!');
      return;
    }
    try {
      final file = File(path);
      if (await file.exists()) {
        _jsonController.text = await file.readAsString();
      } else {
        _showMessage('JSON file not found!');
      }
    } catch (e) {
      _showMessage('Error reading JSON file!');
    }
  }

  void _saveJsonFile() async {
    final path = _jsonPathController.text;
    final content = _jsonController.text;
    if (path.isEmpty || content.isEmpty) {
      _showMessage('JSON path or content is empty!');
      return;
    }
    try {
      final file = File(path);
      await file.writeAsString(content);
      _showMessage('JSON saved successfully!');
    } catch (e) {
      _showMessage('Error saving JSON file!');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CSV/JSON Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _csvController,
              decoration: InputDecoration(labelText: 'CSV Input'),
              maxLines: 5,
            ),
            TextField(
              controller: _jsonController,
              decoration: InputDecoration(labelText: 'JSON Output'),
              maxLines: 5,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: _convertCsvToJson,
                    child: Text('Convert to JSON')),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: _convertJsonToCsv,
                    child: Text('Convert to CSV')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: _clearFields, child: Text('Clear')),
              ],
            ),
            TextField(
              controller: _csvPathController,
              decoration: InputDecoration(labelText: 'CSV File Path'),
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: _openCsvFile, child: Text('Open CSV')),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: _saveCsvFile, child: Text('Save CSV')),
              ],
            ),
            TextField(
              controller: _jsonPathController,
              decoration: InputDecoration(labelText: 'JSON File Path'),
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: _openJsonFile, child: Text('Open JSON')),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: _saveJsonFile, child: Text('Save JSON')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
