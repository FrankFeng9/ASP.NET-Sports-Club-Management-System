using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace assignment3.Models
{
    [Table("games")]
    public partial class Game
    {
        [Key]
        [Column("game_id")]
        public int GameId { get; set; }
        [Column("game_date", TypeName = "date")]
        [DataType(DataType.Date)]
        [Display(Name = "Date")]
        public DateTime? GameDate { get; set; }
        [Column("field")]
        [StringLength(50)]
        public string Field { get; set; }
        [Column("home_team_id")]
        public int? HomeTeamId { get; set; }
        [Column("home_team_score")]
        [Display(Name = "Score")]
        public int? HomeTeamScore { get; set; }
        [Column("away_team_id")]
        public int? AwayTeamId { get; set; }
        [Column("away_team_score")]
        [Display(Name = "Score")]
        public int? AwayTeamScore { get; set; }
        [Column("referee_id")]
        public int? RefereeId { get; set; }
        [Column("game_notes")]
        [StringLength(1000)]
        [Display(Name = "Game Notes")]
        public string GameNotes { get; set; }

        [ForeignKey(nameof(AwayTeamId))]
        [InverseProperty(nameof(Team.GameAwayTeams))]
        [Display(Name = "Away")]
        public virtual Team AwayTeam { get; set; }
        [ForeignKey(nameof(HomeTeamId))]
        [InverseProperty(nameof(Team.GameHomeTeams))]
        [Display(Name = "Home")]
        public virtual Team HomeTeam { get; set; }
        [ForeignKey(nameof(RefereeId))]
        [InverseProperty(nameof(Person.Games))]
        public virtual Person Referee { get; set; }
    }
}
