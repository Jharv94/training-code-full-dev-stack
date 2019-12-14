
using System.Linq;
using RestApi.Client.Controllers;
using RestApi.Data;
using Xunit;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using RestApi.data.Models;

namespace RestApi.Testing.Client
{
  public class PokemonUnitTest
  {
    [Fact]
    public async void Test_GetAllPokemon()
    {
      //serialization
      //httpclient
      //casting
      var sut = new PokemonController(new PokemonDbContext());
      
      var actual = await sut.Get() as List<Pokemon>;

      Assert.NotNull(actual);
      Assert.True(actual.Count() > 0);
    }

    [Theory]
    [InlineData(1)]
    [InlineData(2)]
    [InlineData(3)]
    public async void Test_GetPokemon(int id)
    {
      var sut = new PokemonController(new PokemonDbContext());
      
      var actual = await sut.Get(id) as List<Pokemon>;

      Assert.False(string.IsNullOrWhiteSpace(actual.Name));
    }
  }
}