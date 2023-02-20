import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PatientForm extends StatefulWidget {
  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _admissionDateController =
      TextEditingController();
  String? _gender;
  DateTime? _admissionDate;

  @override
  void dispose() {
    _nameController.dispose();
    _admissionDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'I. HÀNH CHÍNH',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Họ và tên',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Giới tính',
                    border: OutlineInputBorder(),
                  ),
                  value: _gender,
                  items: const [
                    DropdownMenuItem(value: '', child: Text('')),
                    DropdownMenuItem(value: 'Nam', child: Text('Nam')),
                    DropdownMenuItem(value: 'Nữ', child: Text('Nữ')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _gender = value ?? '';
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () async {
                    final currentDate = _admissionDate ?? DateTime.now();
                    final date = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      setState(() {
                        _admissionDate = date;
                      });
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: Text(
                    _admissionDate != null
                        ? DateFormat('dd/MM/yyyy').format(_admissionDate!)
                        : 'Ngày giờ nhập viện',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Save the form data
                      String name = _nameController.text.trim();
                      String gender = _gender ?? '';
                      DateTime admissionDate =
                          DateTime.parse(_admissionDateController.text.trim());

                      // Do something with the form data
                      print('Name: $name');
                      print('Gender: $gender');
                      print('Admission date: $admissionDate');
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
