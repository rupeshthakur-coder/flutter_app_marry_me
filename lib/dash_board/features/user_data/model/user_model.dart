class UserData {
  String uid;
  String email;
  PersonalData personalData;
  UserFiles userFiles;
  SocialGraph socialGraph;
  CompatibilityScores compatibilityScores;
  FeedbackData feedbackData;

  UserData({
    required this.uid,
    required this.email,
    required this.personalData,
    required this.userFiles,
    required this.socialGraph,
    required this.compatibilityScores,
    required this.feedbackData,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "personalData": personalData.toJson(),
        "userFiles": userFiles.toJson(),
        "socialGraph": socialGraph.toJson(),
        "compatibilityScores": compatibilityScores.toJson(),
        "feedbackData": feedbackData.toJson(),
      };
}

class PersonalData {
  String temporaryAddress;
  String permanentAddress;
  String job;
  List<String> expertise;
  String religion;
  DateTime dob;
  String dreamPlaceToVisit;

  PersonalData({
    required this.temporaryAddress,
    required this.permanentAddress,
    required this.job,
    required this.expertise,
    required this.religion,
    required this.dob,
    required this.dreamPlaceToVisit,
  });

  Map<String, dynamic> toJson() => {
        "temporaryAddress": temporaryAddress,
        "permanentAddress": permanentAddress,
        "job": job,
        "expertise": expertise,
        "religion": religion,
        "dob": dob.toIso8601String(),
        "dreamPlaceToVisit": dreamPlaceToVisit,
      };
}

class UserFiles {
  String type;
  String url;
  Metadata metadata;

  UserFiles({
    required this.type,
    required this.url,
    required this.metadata,
  });

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
        "metadata": metadata.toJson(),
      };
}

class Metadata {
  String uploadedAt;
  int fileSize;

  Metadata({
    required this.uploadedAt,
    required this.fileSize,
  });

  Map<String, dynamic> toJson() => {
        "uploadedAt": uploadedAt,
        "fileSize": fileSize,
      };
}

class SocialGraph {
  int mutualFriendsCount;
  SocialNetworkInfluence socialNetworkInfluence;

  SocialGraph({
    required this.mutualFriendsCount,
    required this.socialNetworkInfluence,
  });

  Map<String, dynamic> toJson() => {
        "mutualFriendsCount": mutualFriendsCount,
        "socialNetworkInfluence": socialNetworkInfluence.toJson(),
      };
}

class SocialNetworkInfluence {
  int influenceScore;

  SocialNetworkInfluence({
    required this.influenceScore,
  });

  Map<String, dynamic> toJson() => {
        "influenceScore": influenceScore,
      };
}

class CompatibilityScores {
  Map<String, int> userScores;

  CompatibilityScores({
    required this.userScores,
  });

  Map<String, dynamic> toJson() => {
        "userScores": userScores,
      };
}

class FeedbackData {
  List<String> likesGiven;
  Map<String, String> surveyResponses;

  FeedbackData({
    required this.likesGiven,
    required this.surveyResponses,
  });

  Map<String, dynamic> toJson() => {
        "likesGiven": likesGiven,
        "surveyResponses": surveyResponses,
      };
}
