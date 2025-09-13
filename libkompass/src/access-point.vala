[GtkTemplate(ui = "/com/github/kotontrion/libkompass/ui/access-point.ui")]
public class Kompass.AccessPoint : Gtk.ListBoxRow {
  public AstalNetwork.AccessPoint ap { get; construct set; }
  private SimpleActionGroup actions;

  [GtkChild]
  public unowned Gtk.PopoverMenu context_menu;

  [GtkCallback]
  public void open_menu() {
    context_menu.popup();
  }

  [GtkCallback]
  public void toggle_connection() {
    /**
    if (this.ap.connected) {
      this.device.disconnect_device.begin();
    } else {
      this.device.connect_device.begin();
    }
    */
  }

  public AccessPoint(AstalNetwork.AccessPoint ap) {
    Object(ap: ap);

    this.actions = new GLib.SimpleActionGroup();

    /*
    var con_action = new SimpleAction.stateful("connected", null, new Variant.boolean(device.connected));
    con_action.change_state.connect(val => {
      this.toggle_connection();
    });
    this.device.bind_property("connected", con_action, "state",
                              BindingFlags.DEFAULT, (binding, srcval, ref targetval) => {
      bool src = (bool)srcval;
      targetval.set_variant(new Variant("b", src));
      return true;
    });
    this.actions.add_action(con_action);

    var rem_action = new SimpleAction("remove", null);
    rem_action.activate.connect(val => {
      AstalBluetooth.get_default().adapter.remove_device(this.device);
    });
    this.actions.add_action(rem_action);

    this.actions.add_action(
      new PropertyAction("trusted", this.device, "trusted"));
    this.actions.add_action(
      new PropertyAction("blocked", this.device, "blocked"));

    this.insert_action_group("bl-dev", this.actions);
    */
  }
}
