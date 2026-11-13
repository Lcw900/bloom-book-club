CREATE TABLE meetings (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  date TEXT NOT NULL,
  timezone TEXT NOT NULL,
  recurring INTEGER NOT NULL DEFAULT 0,
  room_name TEXT NOT NULL UNIQUE,
  room_url TEXT NOT NULL,
  password_hash TEXT NOT NULL,
  host_hash TEXT NOT NULL,
  created_at INTEGER NOT NULL
);
CREATE TABLE rate_limits (
  bucket TEXT PRIMARY KEY,
  attempts INTEGER NOT NULL DEFAULT 0,
  expires_at INTEGER NOT NULL
);
CREATE INDEX rate_limits_expiry ON rate_limits(expires_at);
