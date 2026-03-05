import 'package:flutter/material.dart';
import 'package:w7_small_homework/model/songs/song.dart';
import 'package:w7_small_homework/ui/screens/library/library_screen.dart';
import 'package:w7_small_homework/ui/states/player_state.dart';
import 'package:w7_small_homework/ui/states/settings_state.dart';
import 'package:w7_small_homework/ui/theme/theme.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({
    super.key,
    required this.settingsState,
    required this.songs,
    required this.playerState,
  });

  final AppSettingsState settingsState;
  final List<Song> songs;
  final PlayerState playerState;

  @override
  Widget build(BuildContext context) {
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
              itemCount: songs.length,
              itemBuilder: (context, index) => SongTile(
                song: songs[index],
                isPlaying: playerState.currentSong == songs[index],
                onTap: () {
                  playerState.start(songs[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
