enum UserRole {
  admin('admin', 3),
  manager('manager', 2),
  user('user', 1);

  const UserRole(this.name, this.level);

  final String name;
  final int level;

  @override
  String toString() => name;

  factory UserRole.fromJson(Map<String, dynamic> json) {
      switch (json['name']) {
      case "admin":
        return UserRole.admin;
      case "manager":
        return UserRole.manager;
      default:
        return UserRole.user;
    }
  }

  Map<String, dynamic> toJason() => {
        "name": name,
        "level": level,
      };
}
