void main() {
  String result = '';

  final ab = AB();
  result += ab.getMessage();

  final ba = BA();
  result += ba.getMessage();

  print(result);
}

/**
 * At first, I found this concept somewhat difficult to understand, until I realized how powerful it was.
 *
 * walk
 * swim
 * fly
 *
 * see image in screenshot
 *
 * կտեսնես, որ թե կատուն, թե աղունիկը, կարող են քայլել, բայց կատուն չի կարող թռչել.
 * Այսինքն, ստացվում ա, որ մենք superclass ով, չենք կարող ապահովել դա(չենք կարող ունենալ օրինակ թռչելու մեթոդ)
 *
 * Եթե լիներ բազմաժառանգություն, կկարողանայինք դա անել, ունենալով, օրինակ՝ Walker, Swimmer, Flyer կլասսերը։
 *
 * Դրա փոխարեն, մենք կարող էինք implement անել class երը, բայդ այդ ժամանակ էլ, ստիպված էին լինելու, նույն լոգիկան գրել մի քանի կլասսերում.
 *
 * From Documentation: //Mixins are a way of reusing a class’s code in multiple class hierarchies.
 *
 * Mixins cannot declare a constructor.
 * Mixins can't extends classes or other mixins.
 *
 * I think you guessed that the order in which the mixins are declared is very important.
 *
 * Mixins in Dart work by creating a new class that layers the implementation of the mixin on top of a
 * superclass to create a new class — it is not “on the side” but “on top” of the superclass, so there
 * is no ambiguity in how to resolve lookups.
 *
 *
 *
 */

mixin A {
  String getMessage() => 'A';
}

mixin B {
  String getMessage() => 'B';
}

class P {
  String getMessage() => 'P';
}

class AB extends P with A, B {}

class BA extends P with B, A {}
