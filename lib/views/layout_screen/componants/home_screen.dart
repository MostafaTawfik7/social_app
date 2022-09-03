import 'package:flutter/material.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: Card(
              elevation: 5,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.network(
                    'https://img.freepik.com/free-photo/portrait-happy-amazed-young-beautiful-lady-with-curly-dark-hair-heard-cool-news-broadly-smiling-looking-camera-pointing-with-finger-copy-space-isolated-pink-background_295783-3092.jpg?w=740&t=st=1661660978~exp=1661661578~hmac=2af7e1ef1c70cec98f620a1541a2fe548a09077a95f779af21c2285b2d49946a',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0, right: 8.0),
                    child: Text(
                      'Communicate with friends',
                      style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) => buildPostWidget(context)),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: 10),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  Widget buildPostWidget(context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      elevation: 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/premium-photo/young-arab-man-wearing-typical-arab-clothes-isolated-white-background-smiling-raising-thumb-up_1187-148542.jpg?w=740'),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Mostafa tawfik',
                            style: TextStyle(height: 1.5),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 16,
                          )
                        ],
                      ),
                      Text(
                        'Janunary 12,2020 at 09:00 pm',
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.shade300,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: double.infinity,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    height: 25,
                    child: MaterialButton(
                      minWidth: 1,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: const Text(
                        '#Software',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                  image: NetworkImage(
                    'https://img.freepik.com/free-photo/blithesome-student-green-t-shirt-posing-with-laptop-indoor-photo-amazed-male-freelancer-isolated_197531-20164.jpg?w=740&t=st=1661592799~exp=1661593399~hmac=ccd5828477905ee811b0b2bd2c3aab7a837c158e5b8bf2bf35cea62a66e42e47',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(
                        IconBroken.Heart,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '205',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(
                        IconBroken.Chat,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '100 commends',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.shade300,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 17,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/premium-photo/young-arab-man-wearing-typical-arab-clothes-isolated-white-background-smiling-raising-thumb-up_1187-148542.jpg?w=740'),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'write a commend....',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: const [
                        Icon(
                          IconBroken.Heart,
                          color: Colors.red,
                        ),
                        SizedBox(width: 5),
                        Text('Like'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
