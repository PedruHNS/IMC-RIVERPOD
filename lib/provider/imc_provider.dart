import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imc_riverpod/model/model_imc.dart';
import 'package:imc_riverpod/provider/state_provider.dart';

final imcProvider =
    StateNotifierProvider<ImcNotifier, StateIMC>((ref) => ImcNotifier());

class ImcNotifier extends StateNotifier<StateIMC> {
  ImcNotifier()
      : super(
          StateInitialImc(
            pessoa: ModelIMC(),
          ),
        );

  void calcular({required double peso, required double altura}) {
    final imc = peso / (altura * altura);

    if (imc < 18.5) {
      state = StateBaixoPesoImc(
        pessoa: ModelIMC(
          imc: imc,
          image: '',
          status: 'magro',
          altura: altura,
          peso: peso,
        ),
      );

      return;
    }
    if (imc < 24.9) {
      state = StateNormalImc(
          pessoa: ModelIMC(
        imc: imc,
        image: '',
        status: 'normal',
        altura: altura,
        peso: peso,
      ));

      return;
    }
    if (imc < 29.9) {
      state = StateSobrePesoImc(
          pessoa: ModelIMC(
        imc: imc,
        image: '',
        status: 'Sobre Peso',
        altura: altura,
        peso: peso,
      ));

      return;
    }
    if (imc > 30.9) {
      state = StateObesidadeImc(
          pessoa: ModelIMC(
        imc: imc,
        image: '',
        status: 'Obesidade',
        altura: altura,
        peso: peso,
      ));

      return;
    }
  }
}
