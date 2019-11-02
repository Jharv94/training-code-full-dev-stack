using System;
using MediaWorld.Domain.Abstracts;

namespace MediaWorld.Domain.Models
{
  public class Song : AAudio 
  {
    public Song()
    {
      Initialize();
    }

    //NOT NEED BECAUSE FACTORY
    // public Song(string title, string author, TimeSpan duration, int bitrate)
    // {
    //   Initialize(title, author, duration, bitrate);
    // }

    private void Initialize(string title="Untitled", string author="Untitled", TimeSpan duration=new TimeSpan(), int bitrate=128)
    {
      Title=title;
      Author=author;
      Duration=duration;
      BitRate=bitrate;
    }
  }

}