import 'package:flutter/material.dart';
import 'package:lms/screens/components/dropdown.dart';
import 'package:lms/screens/profile.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String selectedLab = labz[0];
  String selectedCourse = courses[0];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _labController = TextEditingController();
  final TextEditingController _profileImageController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Sign Up'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextField(_firstnameController, 'First Name'),
              const SizedBox(height: 10),
              _buildTextField(_lastnameController, 'Last Name'),
              const SizedBox(height: 10),
              _buildTextField(_emailController, 'Email'),
              const SizedBox(height: 10),
              _buildTextField(_phoneController, 'Phone'),
              const SizedBox(height: 10),
              _buildDropdown(courses, selectedCourse, 'Course', (newValue) {
                setState(() {
                  selectedCourse = newValue!;
                });
              }),
              const SizedBox(height: 10),
              _buildDropdown(labz, selectedLab, 'Lab', (newValue) {
                setState(() {
                  selectedLab = newValue!;
                });
              }),
              const SizedBox(height: 10),
              _buildTextField(_profileImageController, 'Profile Image URL'),
              const SizedBox(height: 10),
              _buildTextField(_githubController, 'GitHub URL'),
              const SizedBox(height: 10),
              _buildTextField(_addressController, 'Address'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                          firstname: _firstnameController.text,
                          lastname: _lastnameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                          course: selectedCourse,
                          lab: selectedLab,
                          profileImage: _profileImageController.text,
                          github: _githubController.text,
                          address: _addressController.text,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Signup'),
              ),
              OutlinedButton.icon(
                style: const ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                icon: const Icon(Icons.near_me),
                onPressed: () {},
                label: const Text("Outlined Button"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  Widget _buildDropdown(List<String> items, String selectedItem, String label, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      value: selectedItem,
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select a $label';
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _courseController.dispose();
    _labController.dispose();
    _profileImageController.dispose();
    _githubController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}
