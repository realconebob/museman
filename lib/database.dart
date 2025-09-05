import "package:sqlite3/sqlite3.dart";

// Minimum set of supported database ops should include:
    // Inserting entries (songs)
    // Deleting entries
    // Updating entries

    // Creating tables (playlists)
    // Dropping tables
    // Merging tables

    // Creating views of tables (temp playlists via song criteria) (tmp playlist / whatever else a view can do)

abstract interface class DBHandler {
  // For the sake of ease, all data to be added via an entry is both positional relative to the table, and passed as a string. Typing is to be defered to the RDBMS
  bool addEntries(List<String> data);
  bool delEntries(String where);
  bool updEntries(List<String> data, String where);

  bool addTable(String tablename, List<String> constraints);
  bool delTable(String tablename);
  bool mrgTable(String table1, String table2, String where);

  bool createView(String name, String select);
}

// class Sqlite3DBHandler implements DBHandler {
//   static final String DEFAULT_DBPATH = "TODO: REPLACE ME";
//   final Database _sql3db;

//   Sqlite3DBHandler([String? dbfile]): _sql3db = sqlite3.open(dbfile ?? DEFAULT_DBPATH)

// }