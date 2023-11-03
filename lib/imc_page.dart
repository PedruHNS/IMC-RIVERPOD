import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imc_riverpod/provider/imc_provider.dart';

class HomeIMC extends ConsumerStatefulWidget {
  const HomeIMC({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeIMCState();
}

class _HomeIMCState extends ConsumerState<HomeIMC> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  @override
  void dispose() {
    _pesoController.dispose();
    _alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC-RIVERPOD'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: _pesoController,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: const InputDecoration(
              label: Text('Peso (Kg)'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: _alturaController,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: const InputDecoration(
              label: Text('Altura (M)'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            ref.read(imcProvider.notifier).calcular(
                peso: double.parse(_pesoController.text),
                altura: double.parse(_alturaController.text));

            _alturaController.clear();
            _pesoController.clear();
          },
          child: const Text('Calcular'),
        ),
        Consumer(
          builder: (_, ref, __) {
            final calculado = ref.watch(imcProvider);

            final imc = (calculado.pessoa.imc == null)
                ? ''
                : calculado.pessoa.imc!.toStringAsFixed(2);

            final status = (calculado.pessoa.status == null)
                ? ''
                : calculado.pessoa.status!;

            final altura = (calculado.pessoa.altura == null)
                ? ''
                : calculado.pessoa.altura!.toStringAsFixed(2);

            final peso = (calculado.pessoa.peso == null)
                ? ''
                : calculado.pessoa.peso!.toStringAsFixed(2);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'IMC: $imc',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Status: $status',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Altura: $altura (m)',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Peso: $peso (Kg)',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            );
          },
        )
      ]),
    );
  }
}
