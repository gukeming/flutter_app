class DetailEntity {
	String name;
	String alt;
	String id;

	DetailEntity({this.name, this.alt, this.id});

	DetailEntity.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		alt = json['alt'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['alt'] = this.alt;
		data['id'] = this.id;
		return data;
	}
}
