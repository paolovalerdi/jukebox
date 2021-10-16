import 'package:flutter/material.dart';

class RegisterDialog extends StatelessWidget {
  const RegisterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: 420,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text("Nombre de usuario"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  label: Text("Contraseña"),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text("Registrarse"),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
