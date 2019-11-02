using System;
using MediaWorld.Domain.Abstracts;

namespace MediaWorld.Domain.Models
{
  public class Photo : AVideo 
  {
    public Photo()
    {
      Initialize();
    }

    //NOT NEED BECAUSE FACTORY
    // public Photo(string title, string author)
    // {
    //   Initialize(title, author);
    // }

    private void Initialize(string title="Untitled", string author="Untitled")
    {
      Title=title;
      Director=author;
    }
  }

}