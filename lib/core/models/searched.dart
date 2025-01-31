import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    SearchModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

  get id => null;

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Result {
    String? backdropPath;
    int id;
    String? title;
    String? originalTitle;
    String overview;
    String? posterPath;
    MediaType mediaType;
    bool adult;
    String originalLanguage;
    List<int> genreIds;
    double popularity;
    DateTime? releaseDate;
    bool? video;
    double voteAverage;
    int voteCount;
    String? name;
    String? originalName;
    DateTime? firstAirDate;
    List<String>? originCountry;

    Result({
        required this.backdropPath,
        required this.id,
        this.title,
        this.originalTitle,
        required this.overview,
        required this.posterPath,
        required this.mediaType,
        required this.adult,
        required this.originalLanguage,
        required this.genreIds,
        required this.popularity,
        this.releaseDate,
        this.video,
        required this.voteAverage,
        required this.voteCount,
        this.name,
        this.originalName,
        this.firstAirDate,
        this.originCountry,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"] ?? '',
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"] ?? '',
        posterPath: json["poster_path"] ?? '',
        mediaType: mediaTypeValues.map[json["media_type"]] ?? MediaType.MOVIE,
        adult: json["adult"] ?? false,
        originalLanguage: json["original_language"] ?? '',
        genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"].map((x) => x ?? 0)),
        popularity: (json["popularity"] ?? 0.0).toDouble(),
        releaseDate: json["release_date"] == null ? null : DateTime.tryParse(json["release_date"] ?? ''),
        video: json["video"] ?? false,
        voteAverage: (json["vote_average"] ?? 0.0).toDouble(),
        voteCount: json["vote_count"] ?? 0,
        name: json["name"] ?? '',
        originalName: json["original_name"] ?? '',
        firstAirDate: json["first_air_date"] == null ? null : DateTime.tryParse(json["first_air_date"] ?? ''),
        originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x ?? '')),
    );

    Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaTypeValues.reverse[mediaType],
        "adult": adult,
        "original_language": originalLanguage,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "name": name,
        "original_name": originalName,
        "first_air_date": "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "origin_country": originCountry == null ? [] : List<dynamic>.from(originCountry!.map((x) => x)),
    };

    String get fullBackdropUrl => 'https://image.tmdb.org/t/p/w500$backdropPath';
}

enum MediaType {
    MOVIE,
    TV
}

final mediaTypeValues = EnumValues({
    "movie": MediaType.MOVIE,
    "tv": MediaType.TV
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
