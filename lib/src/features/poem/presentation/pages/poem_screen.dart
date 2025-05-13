// presentation/screens/poem_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_app/src/features/poem/presentation/bloc/poem_state.dart';
import '../bloc/poem_bloc.dart';

class PoemScreen extends StatefulWidget {
  const PoemScreen({super.key});

  @override
  State<PoemScreen> createState() => _PoemScreenState();
}

class _PoemScreenState extends State<PoemScreen> {
  String? selectedAuthor;

  @override
  void initState() {
    super.initState();
    context.read<PoemBloc>().add(FetchAuthorsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( selectedAuthor!=null ? "$selectedAuthor's Poems" : 'Poems'),
      backgroundColor: Colors.lightBlue.shade100,
      actions: [
      

        IconButton(
        onPressed: () {
          context.read<PoemBloc>().add(FetchAuthorsEvent());
        },
        icon: const Icon(Icons.close),
      ),
      ],),

      body: BlocBuilder<PoemBloc, PoemState>(
        builder: (context, state) {
          if (state is PoemLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is PoemInitial){
            return const Center(child: Text("Initial state"));
          }
          else if (state is AuthorsLoaded){
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  DropdownButton<String>(
                    value: selectedAuthor,
                    hint: const Text('Select Author'),
                    isExpanded: true,
                    items: state.authors.map((author) {
                      return DropdownMenuItem<String>(
                        value: author,
                        child: Text(author),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => selectedAuthor = value);
                      if (value != null) {
                        context.read<PoemBloc>().add(FetchPoemsEvent(value));
                      }
                    },
                  ),
                ],
              ),
            );
          }
           else if (state is PoemLoaded) {
            return ListView.builder(
              itemCount: state.poems.length,
              itemBuilder: (context, index) {
                final poem = state.poems[index];
                return ListTile(
                  title: Text(poem.title),
                  subtitle: Text(poem.lines.join('\n')),
                );
              },
            );
          } else if (state is PoemError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Press the button to fetch poems'));
        },
      ),
    );
  }
}
