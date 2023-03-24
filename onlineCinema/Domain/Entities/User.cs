using System;

namespace Domain.Entities
{
    public class User
    {
        public static int Id { get; set; }
        
        public static string Username { get; set; }
        
        public static string Password { get; set; }
        
        public static string Email { get; set; }
        
        public static DateTime CreateTime { get; set; }
        
    }
}