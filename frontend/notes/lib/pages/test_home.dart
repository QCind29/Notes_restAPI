import 'package:flutter/material.dart';
import 'package:notes/models/Note.dart';
import 'package:notes/providers/note_provider.dart';
import 'package:provider/provider.dart';

class TestHome extends StatefulWidget {
  const TestHome({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  List<Note>? tnote;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<NotesProvider>(context, listen: false);
        provider.getAll();

  }

 

  @override
  Widget build(BuildContext context) {
    NotesProvider notesProvider = Provider.of<NotesProvider>(context);
  final List<Note>? ListNote = notesProvider.notes ;


      return Scaffold(
        appBar: AppBar(
          title: const Text("Test notes page"),
          centerTitle: true,
        ),
        body: (notesProvider.isLoading == false)
            ? SafeArea(
                child: (notesProvider.notes!.length > 0) ?
                        ListNoteUI(ListNote)                  
                    : EmptyUI()
                    )
            : LoadingUI() 
            );
  }


  Widget LoadingUI(){
    return const Center(
       child: CircularProgressIndicator()
    );
  }

  Widget EmptyUI(){
    return const Center(
      child: Text("List is empty!"),
    );
  }

  Widget ListNoteUI(List<Note>? a){
    return ListView.builder(
                          itemCount: a?.length,
                          itemBuilder: (context, index) {
                            // Note currentNote = notesProvider.notes![index];
                            return Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey)),
                              ),
                              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    a![index].title,
                                    style: const TextStyle(fontSize: 30),
                                  ),
                                  Text(a[index].content),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                       a[index].dateadded.toString()),
                                  )
                                ],
                              ),
                            );
                          },
    );
  }



  
}
