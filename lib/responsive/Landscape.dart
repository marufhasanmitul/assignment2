import 'package:flutter/material.dart';


class MyLandscapeBody extends StatefulWidget {
  const MyLandscapeBody({Key? key}) : super(key: key);

  @override
  State<MyLandscapeBody> createState() => _MyLandscapeBodyState();
}

class _MyLandscapeBodyState extends State<MyLandscapeBody> {
  List<Map<String,String>> news=[
    {
      "title":"ডেঙ্গুতে এ বছরের সর্বাধিক মৃত্যু",
      "img":"https://www.dailynayadiganta.com/resources/img/article/202307/762905_187.jpg"
    },
    {
      "title":"হাসপাতাল থেকে ফিরে হামলার প্রতিক্রিয়ায় যা বললেন হিরো আলম",
      "img":"https://www.dailynayadiganta.com/resources/img/article/202307/762932_169.jpg"
    },
    {
      "title":"সময় আছে পদত্যাগ করুন : সরকারকে মির্জা ফখরুল",
      "img":"https://www.dailynayadiganta.com/resources/img/article/202307/762898_112.jpg"
    },
    {
      "title":"মানি লন্ডারিং মামলায় জি কে শামীমের ১০ বছরের কারাদণ্ড",
      "img":"https://www.dailynayadiganta.com/resources/img/article/202307/762848_196.JPG"
    },
    {
      "title":"দক্ষিণ আফ্রিকার বিপক্ষের বাংলাদেশ যুবাদের সিরিজ জয়",
      "img":"https://www.dailynayadiganta.com/resources/img/article/202307/762895_165.jpg"
    },
    {
      "title":"প্রধানমন্ত্রীর পদত্যাগের এক দফা দাবিতে সুপ্রিম কোর্টে আইনজীবীদের বিক্ষোভ",
      "img":"https://www.dailynayadiganta.com/resources/img/article/202307/762892_133.jpg"
    },
    {
      "title":"কোনো শক্তিই নির্বাচনকে বানচাল করতে পারবে না",
      "img":"https://www.dailynayadiganta.com/resources/img/article/202307/762887_161.jpg"
    },
    {
      "title":"ক্রিমিয়া সেতুর ওপর ‘আক্রমণে’ ২ জন নিহত",
      "img":"https://www.dailynayadiganta.com/resources/img/article/202307/762924_113.jpg"
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News feeds'),
      ),
      body:GridView.builder(
          itemCount: news.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15
          ),
          itemBuilder: (BuildContext context, int index){
              return Card(
                child:Container(
                  child: Column(
                    children: [
                      Image.network("${news[index]['img']}",width: double.infinity,errorBuilder: (_,__,___){
                        return Icon(Icons.image);
                      }),
                      SizedBox(height: 10,),
                      Text("${news[index]['title']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)

                    ],
                  ),
                )
              );
          }
      ),
    );
  }
}
