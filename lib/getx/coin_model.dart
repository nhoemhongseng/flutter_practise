// To parse this JSON data, do
//
//     final coinModel = coinModelFromJson(jsonString);

class CoinModel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? marketCap;
  double? marketCapRank;
  double? totalVolume;
  double? high24H;
  double? low24H;

  CoinModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.totalVolume,
    required this.high24H,
    required this.low24H,
  });

  getCurrentPrice() => "\$ $currentPrice";

  getDisplayName() => "$name (${symbol?.toUpperCase()})";

  getHight24Hours() => "↑$high24H";

  getLow24Hours() => "↓$low24H";

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"]?.toDouble(),
        marketCap: json["market_cap"]?.toDouble(),
        marketCapRank: json["market_cap_rank"]?.toDouble(),
        totalVolume: json["total_volume"]?.toDouble(),
        high24H: json["high_24h"]?.toDouble(),
        low24H: json["low_24h"]?.toDouble(),
      );
}
