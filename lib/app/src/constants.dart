class Constants {
  static Uri eventUrl = Uri.parse('http://178.128.154.39:8000/api/mobile/events/');
  static Uri authUrl = Uri.parse('http://178.128.154.39:8000/auth/token/token/login/');
  static Uri meUrl = Uri.parse('http://178.128.154.39:8000/auth/users/me/');
  static Uri artistUrl(id) => Uri.parse('http://178.128.154.39:8000/api/mobile/artists/?event=$id');
  static Uri consumableUrl(id) => Uri.parse('http://178.128.154.39:8000/api/mobile/consumables/?event=$id');
  static Uri ticketUrl(id) => Uri.parse('http://178.128.154.39:8000/api/mobile/tickets/?event=$id&status=');
}
