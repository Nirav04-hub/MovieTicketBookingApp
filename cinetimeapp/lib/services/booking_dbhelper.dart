import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:cinetimeapp/models/booking.dart';

class BookingDatabase {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  static Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'booking.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE bookings (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            phone TEXT,
            tickets INTEGER,
            postalCode TEXT,
            cardNumber TEXT,
            cvv TEXT,
            expiryDate TEXT
          )
        ''');
      },
    );
  }

  static Future<void> insertBooking(Booking booking) async {
    final db = await database;
    await db.insert('bookings', booking.toMap());
  }

  static Future<List<Booking>> getAllBookings() async {
    final db = await database;
    final maps = await db.query('bookings');
    return maps.map((map) => Booking.fromMap(map)).toList();
  }
}
