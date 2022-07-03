void main()
{
  print("Hello Dart");

  var name = "세미콜론이 왠말이냐";
  print(name);

  int num1 = 10;
  print(num1);

  double num2 = 10.5;
  print(num2);

  bool bo1 = true;
  print(bo1);

  String str1 = "감귤";
  print(str1);

  var va = "으어어어";
  print(va.runtimeType);
  print("${va}");

  dynamic dyna = "다이나믹은 아무거나 다 들어간다";
  print(dyna);
  dyna = 5;
  print(dyna);

  String? nul = null;
  print(nul);

  // final DateTime now = DateTime.now();
  // const DateTime now2 = DateTime.now();
  // final이나 const나 둘 다 상수지만, const는 값을 미리 초기화 시켜놔야 한다.

  int? a = null;
  a ??= 3;
  print(a);

  var b = 3;
  print(b is int);

  List<dynamic> l = ["아아아아아아ㅏ아", 3];
  print(l);
  print(l[0]);
  print(l.length);
  l.add(6.0);
  l.remove(6.0);
  l.indexOf(6.0);
  l.removeAt(l.length - 1);

  Map<String, String> dict = {"감": "귤", "낑": "깡"};
  print(dict);
  dict.addAll({"금": "귤"});
  dict["감"];
  dict["밀"] = "감";
  dict.remove("밀");
  dict.keys;
  dict.values;

  for (dynamic i in ["감", "귤"])
  {
    print(i);
  }

  print(addNum(2, 3));
}

int addNum(int x, int y)
{
  return x + y;
}