int main(string[] args) {
  Intl.bindtextdomain(Config.GETTEXT_PACKAGE, Config.LOCALEDIR);
  Intl.bind_textdomain_codeset(Config.GETTEXT_PACKAGE, "UTF-8");
  Intl.textdomain(Config.GETTEXT_PACKAGE);

  Kompass.init();

  ensure_types();

  var app = (KompassBar.Application)Object.@new(
    typeof(KompassBar.Application),
    "resource-base-path", "/com/github/kotontrion/kompass-bar/",
    "instance-name", "kompass"
    );
  return app.run(args);
}
