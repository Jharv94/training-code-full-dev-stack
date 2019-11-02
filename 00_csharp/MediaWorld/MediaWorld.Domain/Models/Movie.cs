using System;
using MediaWorld.Domain.Abstracts;

namespace MediaWorld.Domain.Models
{
  public class Movie : AVideo 
  {
    public Movie()
    {
      Initialize();
    }

    //NOT NEED BECAUSE FACTORY
    // public Movie(string title, string director, TimeSpan duration, int framerate)
    // {
    //   Initialize(title, director, duration, framerate);
    // }

    private void Initialize(string title="Untitled", string director="Untitled", TimeSpan duration=new TimeSpan(), int framerate=24)
    {
      Title=title;
      Director=director;
      Duration=duration;
      FrameRate=framerate;
    }
  }

}