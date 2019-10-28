using System;

namespace MediaWorld.Domain.Models
{

  public abstract class Music
  {

    public string Artist { get; set; }

    public string Speaker {get; set; }

    public string Title { get; set; }

    public string Genre { get; set; }

    public TimeSpan Duration { get; set; }

    public Music() 
    {
      Artist = "Kanye West";
      Speaker = "Amazon Speakers";
      Title = "Blood on the Leaves";
      Genre = "Hip-Hop";
      Duration = new TimeSpan(0,3,0);
    }

   public override string ToString()
   {
     return $"{Artist} {Speaker} {Title} {Genre}";
   } 
  }
}