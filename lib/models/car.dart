
class Car {

  String car_name;
  String country;
  int foundation;

	Car.fromJsonMap(Map<String, dynamic> map):
		car_name = map["car_name"],
		country = map["country"],
		foundation = map["foundation"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['car_name'] = car_name;
		data['country'] = country;
		data['foundation'] = foundation;
		return data;
	}
}
