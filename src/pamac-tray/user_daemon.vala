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
	[DBus (name = "org.pamac.user")]
	interface UserDaemon : Object {
		public abstract void refresh_handle () throws IOError;
#if DISABLE_AUR
		public abstract void start_get_updates () throws IOError;
#else
		public abstract void start_get_updates (bool check_aur_updates) throws IOError;
#endif
		[DBus (no_reply = true)]
		public abstract void quit () throws IOError;
		public signal void get_updates_finished (Updates updates);
		public abstract string get_lockfile () throws IOError;
	}
	[DBus (name = "org.pamac.system")]
	interface SystemDaemon : Object {
		[DBus (no_reply = true)]
		public signal void get_updates_finished (Updates updates);
		public signal void emit_event (uint primary_event, uint secondary_event, string[] details);
		public signal void emit_providers (string depend, string[] providers);
		public signal void emit_progress (uint progress, string pkgname, uint percent, uint n_targets, uint current_target);
		public signal void emit_download (string filename, uint64 xfered, uint64 total);
		public signal void emit_totaldownload (uint64 total);
		public signal void emit_log (uint level, string msg);
		public signal void set_pkgreason_finished ();
		public signal void refresh_finished (bool success);
		public signal void trans_prepare_finished (bool success);
		public signal void trans_commit_finished (bool success);
		public signal void get_authorization_finished (bool authorized);
#if DISABLE_AUR
		public signal void write_pamac_config_finished (bool recurse, uint64 refresh_period, bool no_update_hide_icon);
#else
		public signal void write_pamac_config_finished (bool recurse, uint64 refresh_period, bool no_update_hide_icon,
														bool enable_aur, bool search_aur, string aur_build_dir, bool check_aur_updates);
#endif
		public signal void write_alpm_config_finished (bool checkspace);
		public signal void write_mirrors_config_finished (string choosen_country, string choosen_generation_method);
		public signal void generate_mirrors_list_data (string line);
		public signal void generate_mirrors_list_finished ();
	}
}
