import "dart:async";

void main() async
{
    Future<String> name = Future.value("감귤");
    Future<int> age = Future.value(11);

    print(await addNumber(2, 2) + await addNumber(3, 3));
    
    mulNumber(1).listen((event) => print(event));

    playAll().listen((result) => print(result));
}

Future<int> addNumber(int number1, int number2) async
{
    await Future.delayed(Duration(seconds: 2), (() => null));
    return number1 + number2;
}

Stream<int> mulNumber(int number) async*
{
    int i;
    for(i in [1, 2, 3, 4, 5])
    {
        yield i * number;

        await Future.delayed(Duration(seconds: 1));
    }
}

Stream<int> playAll() async*
{
    yield* mulNumber(1);
    yield* mulNumber(1000);
}