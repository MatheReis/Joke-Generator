class Joke {
  String iconUrl;
  String id;
  String url;
  String value;

  Joke({
    required this.iconUrl,
    required this.id,
    required this.url,
    required this.value,
  });

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
        iconUrl: json["icon_url"],
        id: json["id"],
        url: json["url"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "id": id,
        "url": url,
        "value": value,
      };
}
