import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}

class Bucket {
  String job;
  bool isDone;

  Bucket(this.job, this.isDone);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Bucket> bucketList = [Bucket("여행가기", false)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("버킷 리스트"),
          centerTitle: true
      ),

      body: bucketList.isEmpty
          ? Center(child: Text("버킷 리스트가 없습니다."))
          : ListView.builder(
          itemCount: bucketList.length,
          itemBuilder: (context, index) {
            Bucket bucket = bucketList[index];
              return ListTile(
                title: Text(
                  bucket.job,
                  style: TextStyle(
                      fontSize: 24,
                      color: bucket.isDone ? Colors.grey : Colors.black,
                      decoration: bucket.isDone ? TextDecoration.lineThrough : TextDecoration.none
                )
                ),

                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Text("삭제할거?"),
                        actions: [
                          // 취소 버튼
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("취소"),
                          ),
                          // 확인 버튼
                          TextButton(
                            onPressed: () {
                              setState(() {
                                bucketList.removeAt(index);
                              });
                              Navigator.pop(context);
                            },
                            child: Text(
                              "확인",
                              style: TextStyle(color: Colors.pink),
                            ),
                          ),
                        ],);
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    bucket.isDone = !bucket.isDone;
                  });
                },
              );
            }
          ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          String? job = await Navigator.push(context, MaterialPageRoute(builder: (context) => CreateBucketPage()));
          if(job != null){
            setState(() {
              bucketList.add(Bucket(job, false));
            });
          }

        },
      ),
    );
  }
}

class CreateBucketPage extends StatefulWidget {
  const CreateBucketPage({Key? key}) : super(key: key);

  @override
  State<CreateBucketPage> createState() => _CreateBucketPageState();
}

class _CreateBucketPageState extends State<CreateBucketPage> {
  TextEditingController textEditingController = TextEditingController();
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("버킷 리스트"),
          centerTitle: true
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),

        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                  labelText: "하고 싶은 일을 입력하세요",
                  errorText: error
              ),
            ),

            SizedBox(
              height: 20,
            ),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(onPressed: () {
                String job = textEditingController.text;
                if(job.isEmpty) {
                  setState(() {
                    error = "내용을 입력해주세요.";
                  });
                }
                else {
                  setState(() {
                    error = null;
                  });
                  Navigator.pop(context, job);
                }
              },
                child: Text("추가"),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
