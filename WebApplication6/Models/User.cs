using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication6.Models
{
    [Table("User")]
    public class User
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }


        [Column("login")]
        public string Login { get; set; }


        [Column("password")]
        public string Password { get; set; }


        [Column("role")]
        public string Role { get; set; }


        [Column("salt")]
        public string Salt { get; set; }
    }
}