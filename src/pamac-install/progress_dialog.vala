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

//using GIO

namespace Pamac {

	[GtkTemplate (ui = "/org/pamac/installer/interface/progress_dialog.ui")]
	class ProgressDialog : Gtk.ApplicationWindow {

		[GtkChild]
		public Gtk.Box box;
		[GtkChild]
		public Gtk.Button close_button;
		[GtkChild]
		public Gtk.Expander expander;

		public ProgressDialog () {
			Object ();
		}

	}
}
