class Fighter {
  int _force;
  int _sante;

  Fighter({int force = 1, int sante = 100})
      : _force = force,
        _sante = sante;

  get getForce => _force;
  get getSante => _sante;

  set setForce(force) => _force = force;
  set setSante(sante) => _sante = sante;
  //affiche Fighter
  infoFighter() 
  {
    //je check si la sante est sup à 0
    getSante > 0
        ? print("Point de vie ${getSante}")
        : print("Point de vie 0");
  }
}
