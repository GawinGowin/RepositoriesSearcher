class ReposData{
  String name;
  String full_name;
  bool private;
  String avatar_url;
  String html_url;
  String description;
  int stargazers_count;
  int watchers_count;
  int forks_count;
  int open_issues_count;
  String visibility;
  int forks;
  int open_issues;
  int watchers;
  double score;
  ReposData(
    this.name,
    this.full_name ,
    this.private,
    this.avatar_url ,
    this.html_url,
    this.description,
    this.stargazers_count,
    this.watchers_count,
    this.forks_count,
    this.open_issues_count,
    this.visibility,
    this.forks,
    this.open_issues,
    this.watchers,
    this.score,
  );
}

cleanData(inputItem){
  return ReposData(
    inputItem["name"],
    inputItem["full_name"],
    inputItem["private"],
    inputItem["owner"]["avatar_url"] ?? "",
    inputItem["html_url"],
    inputItem["description"] ?? "",
    inputItem["stargazers_count"],
    inputItem["watchers_count"], 
    inputItem["forks_count"], 
    inputItem["open_issues_count"], 
    inputItem["visibility"], 
    inputItem["forks"], 
    inputItem["open_issues"], 
    inputItem["watchers"], 
    inputItem["score"], 
  );
}