import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PatientForm extends StatefulWidget {
  const PatientForm({Key? key}) : super(key: key);
  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _admissionDateController =
      TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _ethnicityController = TextEditingController();
  String? _gender;
  DateTime? _admissionDate;
  int? _yearOfBirth;

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
                TextFormField(
                  controller: _occupationController,
                  decoration: const InputDecoration(
                    labelText: 'Nghề nghiệp',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your occupation';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _ethnicityController,
                  decoration: const InputDecoration(
                    labelText: 'Dân tộc',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your ethnicity';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () async {
                    final currentDate = _yearOfBirth != null
                        ? DateTime(_yearOfBirth!, 1, 1)
                        : DateTime.now();
                    final date = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      initialDatePickerMode: DatePickerMode.year,
                    );
                    if (date != null) {
                      setState(() {
                        _yearOfBirth = date.year;
                      });
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: Text(
                    _yearOfBirth != null
                        ? 'Năm sinh: ${_yearOfBirth.toString()}'
                        : 'Năm sinh',
                  ),
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
                        ? "Ngày giờ nhập viện: ${DateFormat('dd/MM/yyyy').format(_admissionDate!)}"
                        : 'Ngày giờ nhập viện',
                  ),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {}
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
