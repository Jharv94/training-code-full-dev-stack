using System.ComponentModel.DataAnnotations;

namespace RestApi.data.Models
{
  public class Pokemon
  {
    public int Id { get; set;}

    [Required]
    public string Name {get; set;}
  }
}