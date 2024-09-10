
class MeritRecord {
  final String id;
  final int timestamp;
  final int addMeritCount;
  final String image;
  final String sound;

  MeritRecord(this.id, this.timestamp, this.addMeritCount, this.image, this.sound);

  @override
  String toString() {
    return 'MeritRecord{id: $id, timestamp: $timestamp, addMeritCount: $addMeritCount, image: $image, sound: $sound}';
  }
  
  Map<String,dynamic>  toMap()  =>{
    "id":id,
    "timestamp":timestamp,
    "addMeritCount":addMeritCount,
    "image":image,
    "sound":sound,
  };
}
