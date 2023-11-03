import 'package:imc_riverpod/model/model_imc.dart';

class StateIMC {
  final ModelIMC pessoa;

  const StateIMC({required this.pessoa});
}

final class StateInitialImc extends StateIMC {
  const StateInitialImc({required super.pessoa});
}

final class StateObesidadeImc extends StateIMC {
  const StateObesidadeImc({required super.pessoa});
}

final class StateSobrePesoImc extends StateIMC {
  const StateSobrePesoImc({required super.pessoa});
}

final class StateNormalImc extends StateIMC {
  const StateNormalImc({required super.pessoa});
}

final class StateBaixoPesoImc extends StateIMC {
  const StateBaixoPesoImc({required super.pessoa});
}
