import 'package:json_annotation/json_annotation.dart';

part 'casino_games_response.g.dart';

@JsonSerializable()
class CasinoGamesResponse {
  final String? status;
  final List<Games>? games;
  @JsonKey(name: 'total_count')
  final String? totalCount;

  const CasinoGamesResponse({
    this.status,
    this.games,
    this.totalCount,
  });

  factory CasinoGamesResponse.fromJson(Map<String, dynamic> json) =>
      _$CasinoGamesResponseFromJson(json);
}

@JsonSerializable()
class Games {
  final List<String>? categories;
  final List<dynamic>? features;
  final List<dynamic>? themes;
  final List<dynamic>? icons;
  final List<dynamic>? icons2;
  final List<dynamic>? licenseIcons;
  final List<dynamic>? backgrounds;
  final String? id;
  @JsonKey(name: 'server_game_id')
  final String? serverGameId;
  @JsonKey(name: 'extearnal_game_id')
  final String? extearnalGameId;
  @JsonKey(name: 'front_game_id')
  final String? frontGameId;
  final String? name;
  final String? description;
  final String? ratio;
  final String? rtp;
  final String? status;
  final String? provider;
  @JsonKey(name: 'show_as_provider')
  final String? showAsProvider;
  @JsonKey(name: 'provider_title')
  final String? providerTitle;
  @JsonKey(name: 'blocked_countries')
  final List<dynamic>? blockedCountries;
  @JsonKey(name: 'blocked_currencies')
  final List<String>? blockedCurrencies;
  @JsonKey(name: 'has_age_restriction')
  final int? hasAgeRestriction;
  @JsonKey(name: 'icon_1')
  final String? icon1;
  @JsonKey(name: 'icon_2')
  final String? icon2;
  @JsonKey(name: 'icon_3')
  final String? icon3;
  final Types? types;
  @JsonKey(name: 'game_skin_id')
  final String? gameSkinId;
  final List<Cats>? cats;
  final List<dynamic>? feats;
  final List<dynamic>? thms;
  final String? active;

  const Games({
    this.categories,
    this.features,
    this.themes,
    this.icons,
    this.icons2,
    this.licenseIcons,
    this.backgrounds,
    this.id,
    this.serverGameId,
    this.extearnalGameId,
    this.frontGameId,
    this.name,
    this.description,
    this.ratio,
    this.rtp,
    this.status,
    this.provider,
    this.showAsProvider,
    this.providerTitle,
    this.blockedCountries,
    this.blockedCurrencies,
    this.hasAgeRestriction,
    this.icon1,
    this.icon2,
    this.icon3,
    this.types,
    this.gameSkinId,
    this.cats,
    this.feats,
    this.thms,
    this.active,
  });

  factory Games.fromJson(Map<String, dynamic> json) =>
      _$GamesFromJson(json);
}

@JsonSerializable()
class Types {
  @JsonKey(name: 'is_mobile')
  final int? isMobile;
  final int? realMode;
  final int? funMode;

  const Types({
    this.isMobile,
    this.realMode,
    this.funMode,
  });

  factory Types.fromJson(Map<String, dynamic> json) =>
      _$TypesFromJson(json);
}

@JsonSerializable()
class Cats {
  final String? id;
  final String? title;
  final String? type;

  const Cats({
    this.id,
    this.title,
    this.type,
  });

  factory Cats.fromJson(Map<String, dynamic> json) =>
      _$CatsFromJson(json);
}
