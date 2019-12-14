using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using RestApi.data.Models;

namespace RestApi.Data
{
  public class PokemonDbContext : DbContext
  {
    public DbSet<Pokemon> Pokemon {get; set;}


    protected override void OnConfiguring(DbContextOptionsBuilder dbContext)
    {
      dbContext.UseNpgsql("server=localhost;database=postgres;user id=postgres;password=postgres");
    }

    protected override void OnModelCreating(ModelBuilder builder)
    {
      builder.Entity<Pokemon>(o => o.HasKey(k => k.Id));
      builder.Entity<Pokemon>().Property(p => p.Id).UseSerialColumn();

      builder.Entity<Pokemon>().HasData(new List<Pokemon>()
      {
        new Pokemon(){ Id = 1, Name = "Bulbasaur"},
        new Pokemon(){ Id = 2,Name = "Ivysaur"},
        new Pokemon(){ Id = 3,Name = "Venusaur"}
      });
    }
  }
}