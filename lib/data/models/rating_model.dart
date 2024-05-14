///
/// [RatingModel] Rating model
/// 
/// [rate] : rate product model
/// [count] : count product model
/// 
class RatingModel {
    double rate;
    int count;

    RatingModel({
        required this.rate,
        required this.count,
    });

    factory RatingModel.fromMap(Map<String, dynamic> json) => RatingModel(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "rate": rate,
        "count": count,
    };
}