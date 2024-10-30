import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 97, 132, 207),
        ),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String username = 'Sheryl';
  final String password = '123';

  void _login() {
    if (_usernameController.text == username &&
        _passwordController.text == password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DashboardPage(username: _usernameController.text, password: _passwordController.text,),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Terdapat kesalahan pada Username atau Password!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset(
              'assets/images/background.jpeg',
              fit: BoxFit.fill
            ),
          ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(labelText: 'Username'),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 85, 199, 252),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'by Sheryl (22552011122)',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final String username;
  final String password;

  const DashboardPage({super.key, required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset(
              'assets/images/background.jpeg',
              fit: BoxFit.fill
            ),
            ),
            Expanded(
            child: Container(
              color: const Color.fromARGB(255, 72, 115, 150),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Selamat datang di Dashboard Page, $username!',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Username : $username',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Password : $password',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                )
              ),
            ),
          ),

            const Padding(
              padding: EdgeInsets.all(10.0),
              child:
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'by Sheryl (22552011122)',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
