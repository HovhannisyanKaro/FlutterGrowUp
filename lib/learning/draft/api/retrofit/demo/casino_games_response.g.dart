// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casino_games_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CasinoGamesResponse _$CasinoGamesResponseFromJson(Map<String, dynamic> json) =>
    CasinoGamesResponse(
      status: json['status'] as String?,
      games: (json['games'] as List<dynamic>?)
          ?.map((e) => Games.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['total_count'] as String?,
    );

Map<String, dynamic> _$CasinoGamesResponseToJson(
        CasinoGamesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'games': instance.games,
      'total_count': instance.totalCount,
    };

Games _$GamesFromJson(Map<String, dynamic> json) => Games(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      features: json['features'] as List<dynamic>?,
      themes: json['themes'] as List<dynamic>?,
      icons: json['icons'] as List<dynamic>?,
      icons2: json['icons2'] as List<dynamic>?,
      licenseIcons: json['licenseIcons'] as List<dynamic>?,
      backgrounds: json['backgrounds'] as List<dynamic>?,
      id: json['id'] as String?,
      serverGameId: json['server_game_id'] as String?,
      extearnalGameId: json['extearnal_game_id'] as String?,
      frontGameId: json['front_game_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      ratio: json['ratio'] as String?,
      rtp: json['rtp'] as String?,
      status: json['status'] as String?,
      provider: json['provider'] as String?,
      showAsProvider: json['show_as_provider'] as String?,
      providerTitle: json['provider_title'] as String?,
      blockedCountries: json['blocked_countries'] as List<dynamic>?,
      blockedCurrencies: (json['blocked_currencies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hasAgeRestriction: json['has_age_restriction'] as int?,
      icon1: json['icon_1'] as String?,
      icon2: json['icon_2'] as String?,
      icon3: json['icon_3'] as String?,
      types: json['types'] == null
          ? null
          : Types.fromJson(json['types'] as Map<String, dynamic>),
      gameSkinId: json['game_skin_id'] as String?,
      cats: (json['cats'] as List<dynamic>?)
          ?.map((e) => Cats.fromJson(e as Map<String, dynamic>))
          .toList(),
      feats: json['feats'] as List<dynamic>?,
      thms: json['thms'] as List<dynamic>?,
      active: json['active'] as String?,
    );

Map<String, dynamic> _$GamesToJson(Games instance) => <String, dynamic>{
      'categories': instance.categories,
      'features': instance.features,
      'themes': instance.themes,
      'icons': instance.icons,
      'icons2': instance.icons2,
      'licenseIcons': instance.licenseIcons,
      'backgrounds': instance.backgrounds,
      'id': instance.id,
      'server_game_id': instance.serverGameId,
      'extearnal_game_id': instance.extearnalGameId,
      'front_game_id': instance.frontGameId,
      'name': instance.name,
      'description': instance.description,
      'ratio': instance.ratio,
      'rtp': instance.rtp,
      'status': instance.status,
      'provider': instance.provider,
      'show_as_provider': instance.showAsProvider,
      'provider_title': instance.providerTitle,
      'blocked_countries': instance.blockedCountries,
      'blocked_currencies': instance.blockedCurrencies,
      'has_age_restriction': instance.hasAgeRestriction,
      'icon_1': instance.icon1,
      'icon_2': instance.icon2,
      'icon_3': instance.icon3,
      'types': instance.types,
      'game_skin_id': instance.gameSkinId,
      'cats': instance.cats,
      'feats': instance.feats,
      'thms': instance.thms,
      'active': instance.active,
    };

Types _$TypesFromJson(Map<String, dynamic> json) => Types(
      isMobile: json['is_mobile'] as int?,
      realMode: json['realMode'] as int?,
      funMode: json['funMode'] as int?,
    );

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'is_mobile': instance.isMobile,
      'realMode': instance.realMode,
      'funMode': instance.funMode,
    };

Cats _$CatsFromJson(Map<String, dynamic> json) => Cats(
      id: json['id'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CatsToJson(Cats instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
    };
