using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SQLite;

namespace DDCH
{
    public class UserService
    {
        public bool Authenticate(string email, string password, out string role)
        {
            role = null;
            string sql = "SELECT Role FROM Users WHERE Email = @email AND Password = @password AND IsVerified = 1";
            var dt = DatabaseHelper.ExecuteQuery(sql,
                new SQLiteParameter("@email", email),
                new SQLiteParameter("@password", password));

            if (dt.Rows.Count > 0)
            {
                role = dt.Rows[0]["Role"].ToString();
                return true;
            }
            return false;
        }

        public bool Register(string email, string password, string workId, string docType)
        {
            string sql = "INSERT INTO Users (Email, Password, Role, WorkId, DocType, IsVerified) VALUES (@email, @password, 'Contributor', @workId, @docType, 0)";
            try
            {
                DatabaseHelper.ExecuteNonQuery(sql,
                    new SQLiteParameter("@email", email),
                    new SQLiteParameter("@password", password),
                    new SQLiteParameter("@workId", workId),
                    new SQLiteParameter("@docType", docType));
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
