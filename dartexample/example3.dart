void main()
{
    List<String> num = ["0", "1", "2"];
    print(num);
    print(num.asMap());
    print(num.toSet());
    dynamic newNum = num.map((x) => x + "으아");
    print(newNum);

    Map numMap = num.asMap();
    print(numMap.keys.toList());
    print(numMap.values.toList());

    Set numSet = Set.from(num);

    List<Map<String, String>> people = [
        {"name": "로제", "group": "블랙핑크"}, 
        {"name": "지수", "group": "블랙핑크"}, 
        {"name": "RM", "group": "방탄"}, 
        {"name": "뷔", "group": "방탄"}, 
    ];
    dynamic blackPink = people.where((x) => (x["group"] == "블랙핑크"));
    print(blackPink);

    List<int> even = [0, 2, 4, 6];
    List<int> odd = [1, 3, 5, 7];
    print([...even, ...odd]);
}