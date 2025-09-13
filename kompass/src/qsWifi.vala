[GtkTemplate(ui = "/com/github/kotontrion/kompass-bar/ui/qsWifi.ui")]
public class KompassBar.QsWifi : Gtk.Box {
  public AstalNetwork.Network network { get; private set; }

  [GtkChild]
  private unowned Gtk.ListBox networks;

  [GtkChild]
  private unowned Gtk.Switch enable_switch;

  [GtkCallback]
  public void toggle_scan() {
    if (this.network.wifi.scanning) {
    } else {
      this.network.wifi.scan();
    }
  }

  [GtkCallback]
  public void toggle_enabled() {
    this.network.wifi.enabled = this.enable_switch.active;
  }

  private void on_added(AstalNetwork.AccessPoint ap, Gtk.ListBox lb) {
    lb.append(new Kompass.AccessPoint(ap));
  }

  private void on_removed(AstalNetwork.AccessPoint ap, Gtk.ListBox lb) {
    int i = 0;

    Kompass.AccessPoint? point = (Kompass.AccessPoint)lb.get_row_at_index(0);
    while (point != null) {
      if (point.ap == ap) {
        lb.remove(point);
        break;
      }
      point = (Kompass.AccessPoint)lb.get_row_at_index(++i);
    }
  }

  construct {
    this.network = AstalNetwork.get_default();

    this.network.wifi.bind_property("enabled", enable_switch, "active",
                                         GLib.BindingFlags.BIDIRECTIONAL | GLib.BindingFlags.SYNC_CREATE);

    this.network.wifi.access_points.@foreach(ap => this.on_added(ap, this.networks));
  }
}
