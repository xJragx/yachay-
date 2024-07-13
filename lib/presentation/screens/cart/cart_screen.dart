import 'package:aprendiendoflutter/domain/entities/curso/curso_model.dart';
import 'package:aprendiendoflutter/presentation/screens/home/curso_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends ConsumerWidget {
  static const String name = 'cart_screen';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cursosCarrito = ref.watch(cursosCarritoProvider);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 30, 44),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop()),
        title: const Text(
          'Carrito de Compras',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: cursosCarrito.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Carrito vacío',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 30.0,
              ),
              children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: cursosCarrito
                            .map((curso) => _CardCarrito(curso))
                            .toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  //
                  const SizedBox(height: 20.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '1550',
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                      child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      minimumSize:
                          const Size(189, 36), // Tamaño del botón
                    ),
                    onPressed: () {
                      // Acción al presionar el botón
                    },
                    icon: const Icon(
                        Icons.credit_card), // Icono de tarjeta
                    label: const Text(
                      'Ir a pagar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ), // Texto del botón
                    ),
                  )),
                ]),
    );
  }
}

class _CardCarrito extends StatelessWidget {
  final Course curso;
  const _CardCarrito(
    this.curso, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.network(
            curso.banner,
            width: 160.0,
            height: 120.0,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  curso.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${curso.idTeacher}',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFAEAEB1),
                      ),
                    ),
                    Text(
                      '${curso.price}',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF6A55),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
