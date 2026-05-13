using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SQLite;
using System.IO;

namespace DDCH
{
    public static class DatabaseHelper
    {
        private static string dbPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data", "ddch.db");
        private static string connectionString = $"Data Source={dbPath};Version=3;";

        public static void InitializeDatabase()
        {
            try
            {
                string appDataPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data");
                if (!Directory.Exists(appDataPath))
                {
                    Directory.CreateDirectory(appDataPath);
                }

                if (!File.Exists(dbPath))
                {
                    SQLiteConnection.CreateFile(dbPath);
                }

                using (var conn = GetConnection())
                {
                    conn.Open();
                    string sql = @"
                        CREATE TABLE IF NOT EXISTS Users (
                            UserId INTEGER PRIMARY KEY AUTOINCREMENT,
                            Email TEXT UNIQUE,
                            Password TEXT,
                            Role TEXT,
                            WorkId TEXT,
                            DocType TEXT,
                            IsVerified INTEGER DEFAULT 0, -- 0: Pending, 1: Approved, 2: Deactivated
                            CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
                        );

                        CREATE TABLE IF NOT EXISTS Posts (
                            PostId INTEGER PRIMARY KEY AUTOINCREMENT,
                            UserId INTEGER,
                            Category TEXT, -- Agriculture, Water, Health, Jobs, Safety
                            Title TEXT,
                            Content TEXT,
                            Status TEXT DEFAULT 'Pending', -- Pending, Approved, Rejected, Deactivated
                            ImagePath TEXT,
                            CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
                            FOREIGN KEY (UserId) REFERENCES Users(UserId)
                        );

                        -- Insert specific admin if not exists
                        INSERT OR IGNORE INTO Users (Email, Password, Role, IsVerified) 
                        VALUES ('fikaduabraham093@gmail.com', '12345qwer', 'Admin', 1);
                        
                        CREATE TABLE IF NOT EXISTS AuditLogs (
                            LogId INTEGER PRIMARY KEY AUTOINCREMENT,
                            Action TEXT,
                            Description TEXT,
                            PerformedBy TEXT,
                            Target TEXT,
                            Severity TEXT,
                            Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
                        );
                    ";
                    using (var cmd = new SQLiteCommand(sql, conn))
                    {
                        cmd.ExecuteNonQuery();
                    }

                    // Ensure ImagePath column exists in Posts table
                    try
                    {
                        using (var cmd = new SQLiteCommand("ALTER TABLE Posts ADD COLUMN ImagePath TEXT;", conn))
                        {
                            cmd.ExecuteNonQuery();
                        }
                    }
                    catch { /* Column already exists */ }
                }
            }
            catch (Exception ex)
            {
                LogError("InitializeDatabase", ex);
            }
        }

        public static SQLiteConnection GetConnection()
        {
            return new SQLiteConnection(connectionString);
        }

        public static DataTable ExecuteQuery(string sql, params SQLiteParameter[] parameters)
        {
            DataTable dt = new DataTable();
            try
            {
                using (var conn = GetConnection())
                {
                    using (var cmd = new SQLiteCommand(sql, conn))
                    {
                        if (parameters != null) cmd.Parameters.AddRange(parameters);
                        using (var adapter = new SQLiteDataAdapter(cmd))
                        {
                            adapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                LogError("ExecuteQuery: " + sql, ex);
            }
            return dt;
        }

        public static object ExecuteScalar(string sql, params SQLiteParameter[] parameters)
        {
            try
            {
                using (var conn = GetConnection())
                {
                    conn.Open();
                    using (var cmd = new SQLiteCommand(sql, conn))
                    {
                        if (parameters != null) cmd.Parameters.AddRange(parameters);
                        return cmd.ExecuteScalar();
                    }
                }
            }
            catch (Exception ex)
            {
                LogError("ExecuteScalar: " + sql, ex);
                return null;
            }
        }

        public static int ExecuteNonQuery(string sql, params SQLiteParameter[] parameters)
        {
            try
            {
                using (var conn = GetConnection())
                {
                    conn.Open();
                    using (var cmd = new SQLiteCommand(sql, conn))
                    {
                        if (parameters != null) cmd.Parameters.AddRange(parameters);
                        return cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                LogError("ExecuteNonQuery: " + sql, ex);
                return -1;
            }
        }

        public static void LogAudit(string action, string description, string performedBy, string target, string severity)
        {
            try
            {
                string sql = "INSERT INTO AuditLogs (Action, Description, PerformedBy, Target, Severity) VALUES (@action, @desc, @by, @target, @severity)";
                ExecuteNonQuery(sql,
                    new SQLiteParameter("@action", action),
                    new SQLiteParameter("@desc", description),
                    new SQLiteParameter("@by", performedBy),
                    new SQLiteParameter("@target", target),
                    new SQLiteParameter("@severity", severity)
                );
            }
            catch (Exception ex)
            {
                LogError("LogAudit", ex);
            }
        }

        private static void LogError(string context, Exception ex)
        {
            try
            {
                string logPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data", "errors.log");
                string message = string.Format("[{0}] Context: {1} - Error: {2}\nStack Trace: {3}\n\n",
                    DateTime.Now.ToString(), context, ex.Message, ex.StackTrace);
                File.AppendAllText(logPath, message);
            }
            catch { }
        }
    }
}
