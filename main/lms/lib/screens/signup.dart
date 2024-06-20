import 'package:flutter/material.dart';
import 'package:lms/screens/components/dropdown.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // String? Function(String?)? validator
  String selectedLab = labz[0];
  String selectedCourse = courses[0]; //Set the initial selected value
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

              _buildTextField(_courseController, 'Course'),
              DropdownButton(
                  isExpanded: true,
                  enableFeedback: true,
                  value: selectedCourse,
                  items: courses.map((String item) {
                    return DropdownMenuItem(
                        alignment: Alignment.centerRight,
                        enabled: selectedCourse != item,
                        value: item,
                        child: Text(item));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCourse = newValue!;
                    });
                  }),
              const SizedBox(height: 10),

              _buildTextField(_labController, 'Lab'),
              DropdownButton(
                  isExpanded: true,
                  enableFeedback: true,
                  value: selectedLab,
                  items: labz.map((String item) {
                    return DropdownMenuItem(
                        alignment: Alignment.centerRight,
                        enabled: selectedLab != item,
                        value: item,
                        child: Text(item));
                  }).toList(),
                  onChanged: (String? newValue) {
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
                    // Process data
                  }
                },
                child: const Text('Signup'),
              ),
              // ElevatedButton.icon(
              //   style: const ButtonStyle(
              //     shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
              //     backgroundColor: WidgetStatePropertyAll(Colors.amber),
              //   ),
              //   icon: const Icon(Icons.near_me),
              //   onPressed: () {},
              //   label: const Text("Elevetad Button"),
              // ),
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
