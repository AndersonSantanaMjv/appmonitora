class InfraEntity {
  String uuid;
  String descricaoDoMonitorado;

  InfraEntity({
    required this.uuid,
    required this.descricaoDoMonitorado,
  });

  factory InfraEntity.fromJson(Map<String, dynamic> json) {
    return InfraEntity(
      uuid: json['uuid'],
      descricaoDoMonitorado: json['descricaoDoMonitorado'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'descricaoDoMonitorado': descricaoDoMonitorado,
    };
  }

  static List<InfraEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((item) => InfraEntity.fromJson(item)).toList() ?? [];
  }
}
