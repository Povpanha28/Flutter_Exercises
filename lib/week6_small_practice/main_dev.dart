import 'package:app/week6_small_practice/data/repositories/songs/song_repository_mock.dart';
import 'package:app/week6_small_practice/data/repositories/songs/song_repository_remote.dart';
import 'package:provider/provider.dart';

import 'data/repositories/songs/song_repository.dart';
import 'main_common.dart';

/// Configure provider dependencies for dev environement
List<Provider> get providersLocal {
  return [
    Provider<SongRepository>(create: (context) => SongRepositoryMock()),
    Provider<SongRepositoryRemote>(create: (context) => SongRepositoryRemote()),
  ];
}

void main() {
  mainCommon(providersLocal);
}
