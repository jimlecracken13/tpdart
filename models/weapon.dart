class Weapon {
  String _arme;
  int _puissance;
  int _precision;
  //constructor
  Weapon({String arme = "excalibur", int puissance = 0, int precision = 0})
      : _arme = arme,
        _puissance = puissance,
        _precision = precision;
  get getArme => _arme;
  get getPuissance => _puissance;
  get getPrecision => _precision;

  set setArme(String arme) => _arme = arme;
  set setPuissance(int puissance) => _puissance = puissance;
  set setPrecision(int precision) => _precision = precision;
}
