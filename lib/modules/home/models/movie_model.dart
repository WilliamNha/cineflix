class MovieModel {
  String? sId;
  String? name;
  String? description;
  String? type;
  String? country;
  String? release;
  String? director;
  String? production;
  String? cast;
  String? rating;
  String? duration;
  String? ratingType;
  String? imageBanner;
  String? image;
  String? video;
  List<Genre>? genre;
  List<Category>? category;

  MovieModel(
      {this.sId,
      this.name,
      this.description,
      this.type,
      this.country,
      this.release,
      this.director,
      this.production,
      this.cast,
      this.rating,
      this.duration,
      this.ratingType,
      this.imageBanner,
      this.image,
      this.video,
      this.genre,
      this.category});

  MovieModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    country = json['country'];
    release = json['release'];
    director = json['director'];
    production = json['production'];
    cast = json['cast'];
    rating = json['rating'];
    duration = json['duration'];
    ratingType = json['rating_type'];
    imageBanner = json['image_banner'];
    image = json['image'];
    video = json['video'];
    if (json['genre'] != null) {
      genre = <Genre>[];
      json['genre'].forEach((v) {
        genre!.add(Genre.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['type'] = type;
    data['country'] = country;
    data['release'] = release;
    data['director'] = director;
    data['production'] = production;
    data['cast'] = cast;
    data['rating'] = rating;
    data['duration'] = duration;
    data['rating_type'] = ratingType;
    data['image_banner'] = imageBanner;
    data['image'] = image;
    data['video'] = video;
    if (genre != null) {
      data['genre'] = genre!.map((v) => v.toJson()).toList();
    }
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Genre {
  String? sId;
  String? name;

  Genre({this.sId, this.name});

  Genre.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Category {
  String? sId;
  String? name;

  Category({this.sId, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}
