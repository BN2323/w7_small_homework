import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w7_small_homework/ui/screens/library/view_model/library_view_model.dart';
import 'package:w7_small_homework/ui/screens/library/widgets/library_content.dart';
 
import '../../../data/repositories/songs/song_repository.dart';
import '../../../model/songs/song.dart';
import '../../states/player_state.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final viewModel = LibraryViewModel(
          context.read<SongRepository>(),
          context.read<PlayerState>(),
        );

        viewModel.init();
        return viewModel;
      },
      child: const LibraryContent(),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
