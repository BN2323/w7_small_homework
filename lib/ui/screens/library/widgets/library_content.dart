import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w7_small_homework/ui/screens/library/library_screen.dart';
import 'package:w7_small_homework/ui/screens/library/view_model/library_view_model.dart';
import 'package:w7_small_homework/ui/states/settings_state.dart';
import 'package:w7_small_homework/ui/theme/theme.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LibraryViewModel>();
    final settingsState = context.watch<AppSettingsState>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: viewModel.songs.length,
              itemBuilder: (context, index) {
                final song = viewModel.songs[index];

                return SongTile(
                  song: song,
                  isPlaying: viewModel.isPlaying(song),
                  onTap: () => viewModel.play(song),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
