class ApiConfig {
 static const apiBaseUrl = "http://ec2-13-53-199-161.eu-north-1.compute.amazonaws.com";
  
  static String login = "/api/v1/auth/login";
  static String signUp = "/api/v1/auth/register";
  static String otp = "/api/v1/auth/verify";
  static String recruiterProfile ="/api/v1/user/recruiter";
  static String seekerProfile = "/api/v1/user/profile";
  static String createVacancy = "/api/v1/jobs";
  static String getJobVacany = "/api/v1/jobs";
  static String jobVacancy = "/api/v1/jobs/";
  static String getseekerProfile = "/api/v1/user";
  static String appliedStatus = "/api/v1/jobs/applied";
  static String status = "/api/v1/jobs/applications/";
  static String post = "/api/v1/posts";
  static String postOption = "/api/v1/posts/";
  static String postChat = "/api/v1/chats/messages";
  static String getChat = "/api/v1/chats";
  static String getMessage = "/api/v1/chats/";
}