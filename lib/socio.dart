import 'package:flutter/material.dart';

class SocioDemographicPage extends StatefulWidget {
  @override
  _SocioDemographicPageState createState() => _SocioDemographicPageState();
}

class _SocioDemographicPageState extends State<SocioDemographicPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? schoolName,
      dateOfBirth,
      name,
      gender,
      classSection,
      height,
      weight,
      bmi,
      address,
      hostel;
  String? fatherName,
      motherName,
      fatherContact,
      motherContact,
      siblings,
      brothers,
      sisters,
      birthOrder;

  List<String> genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Socio-Demographic Characteristics',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildTextField(
                    'Name of the School', (value) => schoolName = value),
                buildDateField('Date of Birth'),
                buildTextField('Name', (value) => name = value),
                buildDropdownField(
                    'Gender', genderOptions, (value) => gender = value),
                buildTextField(
                    'Class and Section', (value) => classSection = value),
                buildTextField('Height (cm)', (value) => height = value),
                buildTextField('Weight (kg)', (value) => weight = value),
                buildTextField('BMI', (value) => bmi = value),
                buildTextField('Address', (value) => address = value),
                buildYesNoField(
                    'Do you stay in a hostel?', (value) => hostel = value),
                buildTextField(
                    'Name of the Father', (value) => fatherName = value),
                buildTextField(
                    'Name of the Mother', (value) => motherName = value),
                buildTextField('Contact Number of Father',
                    (value) => fatherContact = value),
                buildTextField('Contact Number of Mother',
                    (value) => motherContact = value),
                buildTextField('How many siblings do you have?',
                    (value) => siblings = value),
                buildTextField('Brothers', (value) => brothers = value),
                buildTextField('Sisters', (value) => sisters = value),
                buildTextField(
                    'Birth Order of the Child', (value) => birthOrder = value),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print('Form is valid. Data saved.');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.all(14.0)),
                  ),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, void Function(String?) onSaved) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        style: TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.blue),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.blue.withOpacity(0.5)),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }

  Widget buildDateField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        readOnly: true,
        onTap: () async {
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            setState(() {
              dateOfBirth = pickedDate.toString();
            });
          }
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.blue),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.blue.withOpacity(0.5)),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select $label';
          }
          return null;
        },
        onChanged: (value) {
          dateOfBirth = value;
        },
      ),
    );
  }

  Widget buildDropdownField(
      String label, List<String> options, void Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.blue),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.blue.withOpacity(0.5)),
          ),
        ),
        value: gender,
        items: options.map((option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select $label';
          }
          return null;
        },
      ),
    );
  }

  Widget buildYesNoField(String label, void Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.blue),
          ),
          Row(
            children: [
              Radio<String>(
                value: 'Yes',
                groupValue: hostel,
                onChanged: onChanged,
              ),
              Text('Yes'),
              Radio<String>(
                value: 'No',
                groupValue: hostel,
                onChanged: onChanged,
              ),
              Text('No'),
            ],
          ),
        ],
      ),
    );
  }
}
