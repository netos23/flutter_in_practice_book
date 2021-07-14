import 'dart:io';
/// About import
import 'dart:math' as math; // rename on import

/// About comments
// Single line comment
/*
* There is multiline comment!
*
* Woooooow!
* */

/// Single line docs
/**
 * Multiline docs!
 *
 * [calculate] - there is link to the method
 * */

/// About vars
String x = 'specified type';
var y = 'auto type';
dynamic z = 'dynamic type';
Object obj = 'every var is object';

/// About constants
const e = 2.7;
// const pi = math.pi compile error, because const is compile level constants
final pi = math.pi; // runtime constants
// Const sample
void test() {
  var lst = [1, 2, 3];
  print(lst);
  lst = const [4, 5, 6];
  print(lst);
  lst[0] = 999; // throw an exception, because list is const
  print(lst);
}

/// About types
// String
String s1 = "double quote string";
String s2 = 'single quote string';
String s3 = '''
    triple quote multiline string''';
String s4 = '$s1 value inject';
String s5 = '${45 + 43} expression inject';

// Nums
num aInt = 5;
num bDouble = 5.5;
int a = 5;
double b = 5.5;

// Bool
bool ch = 6 > 5;

/// Collections
// List
List<double> list = const <double>[1, 23, 67.9];
double v = list[0];
List<int> ints = List(100);

// Set
Set<String> str = const <String>{"a", 'b', '''c'''};
Set<double> doubles = Set();

// Map
Map<int, String> db = {4: 'Masha', 0: 'Kola'};
final name = db[0];
Map map = Map();

/// Enum
enum Platform { PC, MAC, LINUX }

/// as and is
void sampleAsIs() {
  num tmp = 2.5;

  if (tmp is double) {
    print(tmp.toStringAsExponential());
  }

  // throw an error
  print((tmp as int).toRadixString(16));
}

/// Cycles
void sampleCycles() {
  for (var i = 0; i < 10; i++) {
    print('*' * i);
  }

  var t = 10;
  while (t-- > 0) {
    print('#' * t);
  }

  t = 10;
  do {
    print('@' * (t - 5).abs());
  } while (--t >= 0);
}

/// if sample
void sampleIf() {
  var count = 1000;

  if (count > 999) {
    print('Too hot? Please wait!');
  } else {
    print('continue');
  }

  var any = count > 100 ? 34 : 45;
}

/// Switch sample
void sampleSwitch() {
  var pl = Platform.LINUX;

  // full form
  switch (pl) {
    case Platform.PC:
      // TODO: Handle this case.
      break;
    case Platform.MAC:
      // TODO: Handle this case.
      break;
    case Platform.LINUX:
      // TODO: Handle this case.
      break;
    default:
      break;
  }

  // empty and missing cases
  switch (pl) {
    case Platform.PC:
    case Platform.LINUX:
      print('linux');
      break;
    default:
      break;
  }
}

/// Classes
class Hero {
  final String name;
  final Power heroPower;

  Hero(this.name, this.heroPower);

  String introduceYourself() => 'My name is $name '
      'and my power is ${heroPower.powerName}';
}

abstract class Power {
  bool get isPowerAvailable;

  String get powerName;

  void usePower();
}

class UltimateHero extends Hero {
  UltimateHero({name, heroPower}) : super(name, heroPower);
}

class UltimatePower with PowerInfo implements Power {
  final String _powerName;
  bool _isAvailable;

  UltimatePower(this._powerName, this._isAvailable);

  @override
  bool get isPowerAvailable => _isAvailable;

  @override
  String get powerName => _powerName;

  @override
  void usePower() {
    print('Boooooom!');
    _isAvailable = false;
  }
}

enum AttackDistance { LOW, HIGH }

mixin PowerInfo {
  AttackDistance distance;
}

/// Functions
calculate({int count = 1}) {
  return 6 * 7 * count;
}

// Function as obj
calculateAgain({Function f, int val = 1}) {
  f(val);
}

anonimusFunctionSample(List<int> list) {
  list.forEach((el) {
    print('*' * el);
  });
}

nestedFunction() {
  var inside = true;

  superNestedFunction() {
    var superInside = true;

    /// Only debug assembles, throw [AssertionException]
    assert(inside);
    assert(superInside);
    assert(e < 3);
  }

  superNestedFunction();
}

remember(int number) {
  return () => calculate(count: number);
}

/// Async
Future<int> someLongRunningFunction() async {
  // some long actions
  return 0;
}

Stream<int> someLongActions(int max) async* {
  var i = 0;
  while (i < max) {
    yield i++;
  }
}

Iterable<int> syncGenerator(int max) sync* {
  var i = 0;
  while (i < max) {
    yield i++;
  }
}

myActionAsync() async {
  await someLongRunningFunction();
}

myActionFuture() {
  someLongRunningFunction().then((v) => print(v));
}

myActionsAsync() async {
  await for (var i in someLongActions(30)) {
    print(i);
  }
}

myActionsFuture() {
  someLongActions(30).listen((v) => print(v));
}

/// Exceptions
exceptionExample(){
  try{
    if(1 > 2){
      throw Exception('1 < 2');
    }else{
      throw "Strange code";
    }
  } on Exception catch(e){
    rethrow;
  }catch(e){
    print('object has thrown $e');
  }finally{
    print('finally case');
  }
}

/// Metadata
class NotNull{
  final String message;

  const NotNull(this.message);
}

@NotNull('test')
anotatedMethod(){
  @NotNull('var') var test = 0;
}

abstract class Things<V>{
  V getByName(String name);
  void setByName(String name, V val);

  E showFirst<E>(List<E> lst){
    return lst[0];
  }
}