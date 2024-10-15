import 'package:full_app_cinemapedia/domain/domain.dart';
import 'package:full_app_cinemapedia/config/constants/constants.dart';
import 'package:full_app_cinemapedia/infrastructure/models/models.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        character: cast.character,
        profilePath: cast.profilePath != null
            ? '${Paths.imageMovieDBPath}/${cast.profilePath}'
            : 'https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=',
      );
}
