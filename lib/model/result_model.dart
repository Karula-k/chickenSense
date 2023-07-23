class ResultCLass {
  String namaPenyakit;
  String summary;
  List<String> gejala;
  List<String> obat;

  ResultCLass({
    required this.namaPenyakit,
    required this.summary,
    required this.gejala,
    required this.obat,
  });

  factory ResultCLass.fromJson(Map<String, dynamic> json) => ResultCLass(
        namaPenyakit: json["nama_penyakit"],
        summary: json["summary"],
        gejala: List<String>.from(json["gejala"].map((x) => x)),
        obat: List<String>.from(json["obat"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "nama_penyakit": namaPenyakit,
        "summary": summary,
        "gejala": List<dynamic>.from(gejala.map((x) => x)),
        "obat": List<dynamic>.from(obat.map((x) => x)),
      };
}
