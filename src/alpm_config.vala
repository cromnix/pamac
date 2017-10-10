/*
 *  alpm_config
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

[Compact]
class AlpmRepo {
	public string name;
	public Alpm.Signature.Level siglevel;
	public Alpm.Signature.Level siglevel_mask;
	public Alpm.DB.Usage usage;
	public GLib.List<string> urls;

	public AlpmRepo (string name) {
		this.name = name;
		siglevel = Alpm.Signature.Level.USE_DEFAULT;
		usage = 0;
		urls = new GLib.List<string> ();
	}

	public static int compare_name (AlpmRepo a, AlpmRepo b) {
		return strcmp (a.name, b.name);
	}

	public static int search_name (AlpmRepo a, string name) {
		return strcmp (a.name, name);
	}

}

class AlpmConfig {
	string conf_path;
	string? rootdir;
	string? dbpath;
	string? logfile;
	string? gpgdir;
	string? arch;
	double deltaratio;
	int usesyslog;
	public int checkspace;
	GLib.List<string> cachedirs;
	GLib.List<string> hookdirs;
	GLib.List<string> ignoregroups;
	GLib.List<string> ignorepkgs;
	GLib.List<string> noextracts;
	GLib.List<string> noupgrades;
	GLib.List<string> holdpkgs;
	GLib.List<string> syncfirsts;
	Alpm.Signature.Level siglevel;
	Alpm.Signature.Level localfilesiglevel;
	Alpm.Signature.Level remotefilesiglevel;
	Alpm.Signature.Level siglevel_mask;
	Alpm.Signature.Level localfilesiglevel_mask;
	Alpm.Signature.Level remotefilesiglevel_mask;
	GLib.List<AlpmRepo> repo_order;

	public AlpmConfig (string path) {
		conf_path = path;
		reload ();
	}

	public void reload () {
		// set default options
		cachedirs = new GLib.List<string> ();
		hookdirs = new GLib.List<string> ();
		ignoregroups = new GLib.List<string> ();
		ignorepkgs = new GLib.List<string> ();
		noextracts = new GLib.List<string> ();
		noupgrades = new GLib.List<string> ();
		holdpkgs = new GLib.List<string> ();
		syncfirsts = new GLib.List<string> ();
		usesyslog = 0;
		checkspace = 0;
		deltaratio = 0.7;
		siglevel = Alpm.Signature.Level.PACKAGE | Alpm.Signature.Level.PACKAGE_OPTIONAL | Alpm.Signature.Level.DATABASE | Alpm.Signature.Level.DATABASE_OPTIONAL;
		localfilesiglevel = Alpm.Signature.Level.USE_DEFAULT;
		remotefilesiglevel = Alpm.Signature.Level.USE_DEFAULT;
		repo_order = new GLib.List<AlpmRepo> ();
		// parse conf file
		parse_file (conf_path);
		// if rootdir is set and dbpath/logfile are not
		// set, then set those as well to reside under the root.
		if (rootdir != null) {
			if (dbpath == null) {
				dbpath = Path.build_path ("/", rootdir, "var/lib/pacman/");
			}
			if (logfile == null) {
				logfile = Path.build_path ("/", rootdir, "var/log/pacman.log");
			}
		} else {
			rootdir = "/";
			if (dbpath == null) {
				dbpath = "/var/lib/pacman/";
			}
			if (logfile == null) {
				logfile = "/var/log/pacman.log";
			}
		}
		if (cachedirs.length () == 0) {
			cachedirs.append ("/var/cache/pacman/pkg/");
		}
		if (hookdirs.length () == 0) {
			hookdirs.append ("/etc/pacman.d/hooks/");
		}
		if (gpgdir == null) {
			// gpgdir it is not relative to rootdir, even if
			// rootdir is defined because it contains configuration data.
			gpgdir = "/etc/pacman.d/gnupg/";
		}
		if (arch == null) {
			arch = Posix.utsname().machine;
		}
	}

	void parse_file (string path, string? section = null) {
		string? current_section = section;
		var file = GLib.File.new_for_path (path);
		if (file.query_exists ()) {
			try {
				// Open file for reading and wrap returned FileInputStream into a
				// DataInputStream, so we can read line by line
				var dis = new DataInputStream (file.read ());
				string? line;
				// Read lines until end of file (null) is reached
				while ((line = dis.read_line ()) != null) {
					if (line.length == 0) {
						continue;
					}
					// ignore whole line and end of line comments
					string[] splitted = line.split ("#", 2);
					line = splitted[0].strip ();
					if (line.length == 0) {
						continue;
					}
					if (line[0] == '[' && line[line.length-1] == ']') {
						current_section = line[1:-1];
						if (current_section != "options") {
							var repo = new AlpmRepo (current_section);
							if (repo_order.find_custom (repo, AlpmRepo.compare_name) == null) {
								repo_order.append ((owned) repo);
							}
						}
						continue;
					}
					splitted = line.split ("=", 2);
					unowned string key = splitted[0]._strip ();
					unowned string? val = null;
					if (splitted.length == 2) {
						val = splitted[1]._strip ();
					}
					if (key == "Include") {
						parse_file (val, current_section);
					}
					if (current_section == "options") {
						if (key == "RootDir") {
							rootdir = val;
						} else if (key == "DBPath") {
							dbpath = val;
						} else if (key == "CacheDir") {
							foreach (unowned string dir in val.split (" ")) {
								cachedirs.append (dir);
							}
						} else if (key == "HookDir") {
							foreach (unowned string dir in val.split (" ")) {
								hookdirs.append (dir);
							}
						} else if (key == "LogFile") {
							logfile = val;
						} else if (key == "GPGDir") {
							gpgdir = val;
						} else if (key == "LogFile") {
							logfile = val;
						} else if (key == "Architecture") {
							if (val == "auto") {
								arch = Posix.utsname ().machine;
							} else {
								arch = val;
							}
						} else if (key == "UseDelta") {
							deltaratio = double.parse (val);
						} else if (key == "UseSysLog") {
							usesyslog = 1;
						} else if (key == "CheckSpace") {
							checkspace = 1;
						} else if (key == "SigLevel") {
							process_siglevel (val, ref siglevel, ref siglevel_mask);
						} else if (key == "LocalFileSigLevel") {
							process_siglevel (val, ref localfilesiglevel, ref localfilesiglevel_mask);
						} else if (key == "RemoteFileSigLevel") {
							process_siglevel (val, ref remotefilesiglevel, ref remotefilesiglevel_mask);
						} else if (key == "HoldPkg") {
							foreach (unowned string name in val.split (" ")) {
								holdpkgs.append (name);
							}
						} else if (key == "SyncFirst") {
							foreach (unowned string name in val.split (" ")) {
								syncfirsts.append (name);
							}
						} else if (key == "IgnoreGroup") {
							foreach (unowned string name in val.split (" ")) {
								ignoregroups.append (name);
							}
						} else if (key == "IgnorePkg") {
							foreach (unowned string name in val.split (" ")) {
								ignorepkgs.append (name);
							}
						} else if (key == "Noextract") {
							foreach (unowned string name in val.split (" ")) {
								noextracts.append (name);
							}
						} else if (key == "NoUpgrade") {
							foreach (unowned string name in val.split (" ")) {
								noupgrades.append (name);
							}
						}
					} else {
						unowned GLib.List<AlpmRepo>? found = repo_order.search (current_section, (SearchFunc) AlpmRepo.search_name);
						if (found != null) {
							unowned AlpmRepo repo = found.data;
							if (key == "Server") {
								repo.urls.append (val);
							} else if (key == "SigLevel") {
								process_siglevel (val, ref repo.siglevel, ref repo.siglevel_mask);
							} else if (key == "Usage") {
								repo.usage = define_usage (val);
							}
						}
					}
				}
			} catch (GLib.Error e) {
				GLib.stderr.printf("%s\n", e.message);
			}
		} else {
			GLib.stderr.printf ("File '%s' doesn't exist.\n", path);
		}
	}

	Alpm.DB.Usage define_usage (string conf_string) {
		Alpm.DB.Usage usage = 0;
		foreach (unowned string directive in conf_string.split(" ")) {
			if (directive == "Sync") {
				usage |= Alpm.DB.Usage.SYNC;
			} else if (directive == "Search") {
				usage |= Alpm.DB.Usage.SEARCH;
			} else if (directive == "Install") {
				usage |= Alpm.DB.Usage.INSTALL;
			} else if (directive == "Upgrade") {
				usage |= Alpm.DB.Usage.UPGRADE;
			} else if (directive == "All") {
				usage |= Alpm.DB.Usage.ALL;
			}
		}
		return usage;
	}

	void process_siglevel (string conf_string, ref Alpm.Signature.Level siglevel, ref Alpm.Signature.Level siglevel_mask) {
		foreach (unowned string directive in conf_string.split(" ")) {
			bool affect_package = false;
			bool affect_database = false;
			if ("Package" in directive) {
				affect_package = true;
			} else if ("Database" in directive) {
				affect_database = true;
			} else {
				affect_package = true;
				affect_database = true;
			}
			if ("Never" in directive) {
				if (affect_package) {
					siglevel &= ~Alpm.Signature.Level.PACKAGE;
					siglevel_mask |= Alpm.Signature.Level.PACKAGE;
				}
				if (affect_database) {
					siglevel &= ~Alpm.Signature.Level.DATABASE;
					siglevel_mask |= Alpm.Signature.Level.DATABASE;
				}
			} else if ("Optional" in directive) {
				if (affect_package) {
					siglevel |= (Alpm.Signature.Level.PACKAGE | Alpm.Signature.Level.PACKAGE_OPTIONAL);
					siglevel_mask |= (Alpm.Signature.Level.PACKAGE | Alpm.Signature.Level.PACKAGE_OPTIONAL);
				}
				if (affect_database) {
					siglevel |= (Alpm.Signature.Level.DATABASE | Alpm.Signature.Level.DATABASE_OPTIONAL);
					siglevel_mask |= (Alpm.Signature.Level.DATABASE | Alpm.Signature.Level.DATABASE_OPTIONAL);
				}
			} else if ("Required" in directive) {
				if (affect_package) {
					siglevel |= Alpm.Signature.Level.PACKAGE;
					siglevel_mask |= Alpm.Signature.Level.PACKAGE;
					siglevel &= ~Alpm.Signature.Level.PACKAGE_OPTIONAL;
					siglevel_mask |= Alpm.Signature.Level.PACKAGE_OPTIONAL;
				}
				if (affect_database) {
					siglevel |= Alpm.Signature.Level.DATABASE;
					siglevel_mask |= Alpm.Signature.Level.DATABASE;
					siglevel &= ~Alpm.Signature.Level.DATABASE_OPTIONAL;
					siglevel_mask |= Alpm.Signature.Level.DATABASE_OPTIONAL;
				}
			} else if ("TrustedOnly" in directive) {
				if (affect_package) {
					siglevel &= ~(Alpm.Signature.Level.PACKAGE_MARGINAL_OK | Alpm.Signature.Level.PACKAGE_UNKNOWN_OK);
					siglevel_mask |= (Alpm.Signature.Level.PACKAGE_MARGINAL_OK | Alpm.Signature.Level.PACKAGE_UNKNOWN_OK);
				}
				if (affect_database) {
					siglevel &= ~(Alpm.Signature.Level.DATABASE_MARGINAL_OK | Alpm.Signature.Level.DATABASE_UNKNOWN_OK);
					siglevel_mask |= (Alpm.Signature.Level.DATABASE_MARGINAL_OK | Alpm.Signature.Level.DATABASE_UNKNOWN_OK);
				}
			} else if ("TrustAll" in directive) {
				if (affect_package) {
					siglevel |= (Alpm.Signature.Level.PACKAGE_MARGINAL_OK | Alpm.Signature.Level.PACKAGE_UNKNOWN_OK);
					siglevel_mask |= (Alpm.Signature.Level.PACKAGE_MARGINAL_OK | Alpm.Signature.Level.PACKAGE_UNKNOWN_OK);
				}
				if (affect_database) {
					siglevel |= (Alpm.Signature.Level.DATABASE_MARGINAL_OK | Alpm.Signature.Level.DATABASE_UNKNOWN_OK);
					siglevel_mask |= (Alpm.Signature.Level.DATABASE_MARGINAL_OK | Alpm.Signature.Level.DATABASE_UNKNOWN_OK);
				}
			} else {
				GLib.stderr.printf("unrecognized siglevel: %s\n", conf_string);
			}
		}
		siglevel &= ~Alpm.Signature.Level.USE_DEFAULT;
	}
}
