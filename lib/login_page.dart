import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Transparent background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.9],
            colors: [
              Colors.white,
              Color.fromARGB(255, 187, 186, 175),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ), // Limit width for larger screens
              padding: const EdgeInsets.fromLTRB(
                16.0,
                40.0,
                16.0,
                16.0,
              ), // Adjust top padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // Align left
                children: [
                  // Logos and App Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Image.asset(
                          'assets/jssaher.jpg',
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Spacer(), // Spacer to push Pedia Predict to the center
                      Image.asset(
                        'assets/jssstu.jpg',
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ), // Adjust spacing between logos and form

                  // Welcome Message
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, welcome!',
                          style: TextStyle(
                            fontSize: 28, // Larger font size
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Text color
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Please enter your details',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ), // Adjust spacing after welcome message

                  // Username TextFormField
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        textSelectionTheme: TextSelectionThemeData(
                          cursorColor: Colors.black, // Cursor color
                          selectionColor:
                              Theme.of(context).primaryColor, // Selection color
                          selectionHandleColor: Colors.black, // Handle color
                        ),
                        inputDecorationTheme: const InputDecorationTheme(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ), // Border color when focused
                          ),
                        ),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                  ),

                  // Password TextFormField with Toggle Visibility
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        textSelectionTheme: TextSelectionThemeData(
                          cursorColor: Colors.black, // Cursor color
                          selectionColor:
                              Theme.of(context).primaryColor, // Selection color
                          selectionHandleColor: Colors.black, // Handle color
                        ),
                        inputDecorationTheme: const InputDecorationTheme(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ), // Border color when focused
                          ),
                        ),
                      ),
                      child: TextFormField(
                        obscureText: !_isPasswordVisible, // Hide text entered
                        style: TextStyle(
                          color: Colors.black,
                        ), // Password text color
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  _isPasswordVisible = !_isPasswordVisible;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Remember Me Checkbox and Forgot Password Link
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Remember Me',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Implement reset password functionality here
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Login Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity, // Full width
                      decoration: BoxDecoration(
                        color: Colors.black, // Black background color
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          // Always black background
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          // White text
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 16,
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Implement login functionality here
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ), // Small spacing between login button and forgot password link

                  // Sign Up Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to the sign-up screen or perform other actions
                            // Example navigation to a new screen:
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => SignUpPage(),
                            //   ),
                            // );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Dark black text color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
