using System;
using MediaWorld.Domain.Abstracts;

namespace MediaWorld.Domain.Models
{
  public class Book : AAudio 
  {
    public Book()
    {
      Initialize();
    }

    //NOT NEED BECAUSE FACTORY
    // public Book(string title,string author, string narrator, TimeSpan duration, int pagecount, int bitrate)
    // {
    //   Initialize(title, author, narrator, duration, pagecount, bitrate);
    // }

    private void Initialize(string title="Untitled", string author="Untitled", string narrator="Untitled", TimeSpan duration=new TimeSpan(), int pagecount=24, int bitrate = 128)
    {
      Title=title;
      Author=author;
      Narrator=narrator;
      Duration=duration;
      PageCount=pagecount;
      BitRate=bitrate;
    }
  }

}