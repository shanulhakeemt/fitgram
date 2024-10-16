import 'dart:math';

class BmiBrain {
  BmiBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  double _bmi=0;


  String calculateBmi(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi >= 25){
      return 'Overweight';
    }
    else if (_bmi > 18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getMessage(){
    if (_bmi >= 25){
      return 'you have a higher than normal body weight. Try to exercise more.';
    }
    else if (_bmi > 18.5){
      return 'You have a normal body weight. Good job!';
    }
    else{
      return 'you have a lower than normal body weight. You can eat a bit more.';
    }
  }

}