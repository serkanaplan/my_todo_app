import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_todo_app/data/note_repo.dart';

import '../../models/note_model.dart';
import 'edit_pages.dart';

class HomePage extends StatefulWidget {
  late bool isDarkTheme;
  HomePage({required this.isDarkTheme});
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var notes = NoteRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'MyNotes',
                  style: TextStyle(fontFamily: "glock", fontSize: 50),
                ),
                Switch(
                    value: widget.isDarkTheme,
                    onChanged: (Value) {
                      setState(() {
                        widget.isDarkTheme = Value;
                        ThemeData.dark();
                      });
                    }),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (data) {},
              style: const TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintText: "Search notes...",
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                fillColor: Colors.grey.shade900,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              child: FutureBuilder<List<Note>>(
                future: notes.getNotes(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return AnimationLimiter(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        padding: const EdgeInsets.only(top: 5),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final note = snapshot.data![index];
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            delay: Duration(milliseconds: 100),
                            child: SlideAnimation(
                              duration: Duration(milliseconds: 2500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: FadeInAnimation(
                                 curve: Curves.fastLinearToSlowEaseIn,
                  duration: Duration(milliseconds: 2500),
                                child: Card(
                                  elevation: 8, // Gölge efekti ekler
                                  margin: const EdgeInsets.only(bottom: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    foregroundDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                      child: ListTile(
                                        leading: Image.asset(
                                            "assets/img/task.png",
                                            fit: BoxFit.fill),
                                        onTap: () async {
                                          final result = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  EditScreen(note: note),
                                            ),
                                          );
                                        },
                                        title: RichText(
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                            text: '${note.title} \n',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                height: 1.5,
                                                fontFamily: "comfortaa"),
                                            children: [
                                              TextSpan(
                                                text: note.content,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                  height: 1.5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            'Edited: ${note.modifiedTime}',
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () async {
                                            notes.deleteNote(note.id!);
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // Veri almada hata oluştuysa, hatayı gösterin.
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    // Veri henüz almadıysa, bir yükleme göstergesi gösterin.
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const EditScreen(),
            ),
          );

          if (result != null) {
            setState(() {
              notes.getNotes();
            });
          }
        },
        elevation: 10,
        child: const Icon(
          Icons.add,
          size: 38,
        ),
      ),
    );
  }


  
}

