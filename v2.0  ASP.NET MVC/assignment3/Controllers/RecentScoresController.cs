using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using assignment3.Data;
using assignment3.Models;

namespace assignment3.Controllers
{
    public class RecentScoresController : Controller
    {
        private readonly HASCContext _context;

        public RecentScoresController(HASCContext context)
        {
            _context = context;
        }

        // GET: RecentScores
        public async Task<IActionResult> Index()
        {
            //var hASCContext = _context.Games.Include(g => g.AwayTeam).Include(g => g.HomeTeam).Include(g => g.Referee);

            var games = (from a in _context.Games
                    .Include(a => a.HomeTeam)
                    .Include(a => a.AwayTeam)
                    .Where(a => a.HomeTeamScore != null)
                    .OrderByDescending(a => a.GameDate)      
                    select a).Take(10);

            return View(await games.AsNoTracking().ToListAsync());
        }

 
    }
}
