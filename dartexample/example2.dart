void main()
{
    Food f1 = Food("귤");
    print(f1.getName);

    f1.setName = "감";
    print(f1.getName);
}

class Food
{
    String name;
    List<String> kind = ["과일", "고기", "채소"];

    Food(this.name);
  
    String get getName
    {
        return this.name;
    }

    void set setName(String name)
    {
        this.name = name;
    }
}

class Meat extends Food
{
    Meat(super.name);
}

abstract class FoodInterface
{
    String name;

    FoodInterface(this.name);
}

class Generic<T>
{
    T aaa;

    Generic(this.aaa);
}