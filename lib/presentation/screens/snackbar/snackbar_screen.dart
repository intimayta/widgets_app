import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // para ocultar el snackbar anterior

    final snakback = SnackBar(
      content: const Text('INT'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snakback);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // sirve para no poder cerrar el dialogo si no aprieta los botones
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro'),
        content: const Text(
            'Laborum labore cillum voluptate enim. Labore aliqua excepteur sint nulla. Velit est fugiat nisi pariatur ipsum aliqua in incididunt. Irure quis aliquip enim aliquip esse voluptate aute elit aliqua ipsum tempor id. Laboris do ut aliquip culpa veniam do et proident consectetur. Eu deserunt occaecat esse consectetur. Qui deserunt exercitation eu magna labore enim velit consequat tempor ullamco.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Nostrud excepteur duis pariatur dolor laboris dolore duis cillum Lorem tempor enim enim. Eiusmod Lorem nulla aliqua proident tempor consequat. Velit sit ut ea eu ea. Aliqua labore consectetur proident pariatur et id adipisicing exercitation occaecat quis elit nisi est. Esse excepteur consectetur enim excepteur amet ea duis ipsum. Proident anim pariatur dolor consectetur Lorem proident velit et est. Consectetur velit incididunt dolore et exercitation officia non dolor officia fugiat.')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar dialogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
