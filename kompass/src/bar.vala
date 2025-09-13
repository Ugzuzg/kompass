using GtkLayerShell;

[GtkTemplate(ui = "/com/github/kotontrion/kompass-bar/ui/bar.ui")]
public class KompassBar.Bar : Astal.Window {
  public Bar(Gdk.Monitor monitor) {
    Object(
      application: KompassBar.Application.instance,
      namespace : @"bar-$(monitor.get_connector())",
      name: @"bar-$(monitor.get_connector())",
      css_name: "bar",
      gdkmonitor: monitor
      );
  }
}
