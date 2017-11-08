/*
 *  pamac-vala
 *
 *  Copyright (C) 2017 Chris Cromer <cromer@cromnix.org>
 *  Copyright (C) 2014-2017 Guillaume Benoit <guillaume@manjaro.org>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a get of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace Pamac {
	class Manager : Gtk.Application {
		ManagerWindow manager_window;
		bool pamac_run;
		bool started;

		public Manager () {
			application_id = "org.pamac.manager";
			flags = ApplicationFlags.HANDLES_COMMAND_LINE;
		}

		public override void startup () {
			// i18n
			Intl.textdomain ("pamac");
			Intl.setlocale (LocaleCategory.ALL, "");

			base.startup ();

			pamac_run = check_pamac_running ();
			if (pamac_run) {
				var msg = new Gtk.MessageDialog (null,
												Gtk.DialogFlags.MODAL,
												Gtk.MessageType.ERROR,
												Gtk.ButtonsType.OK,
												dgettext (null, "Pamac is already running"));
				msg.run ();
				msg.destroy ();
			} else {
				manager_window = new ManagerWindow (this);

#if ENABLE_HAMBURGER
#else
				var menu = new Menu ();
				menu.append (dgettext (null, "Refresh Databases"), "win.refreshdb");
				menu.append (dgettext (null, "View History"), "win.viewhistory");
				menu.append (dgettext (null, "Install Local Packages"), "win.installlocal");
				menu.append (dgettext (null, "Preferences"), "win.preferences");
				menu.append (dgettext (null, "About"), "win.about");
				menu.append (dgettext (null, "Quit"), "app.quit");
				this.app_menu = menu;

				var quit_action = new SimpleAction ("quit", null);
				quit_action.activate.connect (this.quit);
				this.add_action (quit_action);
#endif

				// quit accel
				var action =  new SimpleAction ("quit", null);
				action.activate.connect  (() => {this.quit ();});
				this.add_action (action);
				string[] accels = {"<Ctrl>Q", "<Ctrl>W"};
				this.set_accels_for_action ("app.quit", accels);
				// back accel
				action =  new SimpleAction ("back", null);
				action.activate.connect  (() => {manager_window.on_button_back_clicked ();});
				this.add_action (action);
				accels = {"<Alt>Left"};
				this.set_accels_for_action ("app.back", accels);
				// search accel
				action =  new SimpleAction ("search", null);
				action.activate.connect  (() => {manager_window.filters_stack.visible_child_name = "search";});
				this.add_action (action);
				accels = {"<Ctrl>F"};
				this.set_accels_for_action ("app.search", accels);

				manager_window.present ();
			}
		}

		public override int command_line (ApplicationCommandLine cmd) {
			if (cmd.get_arguments ()[0] == "pamac-updater") {
				manager_window.display_package_queue.clear ();
				manager_window.main_stack.visible_child_name = "browse";
				manager_window.filters_stack.visible_child_name = "updates";
			} else if (!started) {
				manager_window.show_default_pkgs ();
				started = true;
			}
			if (!pamac_run) {
				manager_window.present ();
				while (Gtk.events_pending ()) {
					Gtk.main_iteration ();
				}
			}
			return 0;
		}

		public override void shutdown () {
			base.shutdown ();
			if (!pamac_run) {
				manager_window.transaction.stop_daemon ();
			}
		}

		bool check_pamac_running () {
			Application app;
			bool run = false;
			app = new Application ("org.pamac.installer", 0);
			try {
				app.register ();
			} catch (GLib.Error e) {
				stderr.printf ("%s\n", e.message);
			}
			run = app.get_is_remote ();
			return run;
		}

#if ENABLE_HAMBURGER
#else
		protected override void activate () {
			new ManagerWindow (this);
		}
#endif
	}

	static int main (string[] args) {
		// This forces the gtk to show the menu icon instead of the global menu to debug
		//Gtk.init (ref args);
		//Gtk.Settings.get_default ().gtk_shell_shows_app_menu = false;
		var manager = new Manager ();
		return manager.run (args);
	}
}
