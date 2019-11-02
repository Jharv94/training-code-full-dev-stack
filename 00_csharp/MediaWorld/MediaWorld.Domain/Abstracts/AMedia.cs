using System;
using System.Threading;
using MediaWorld.Domain.Interfaces;
using static MediaWorld.Domain.Delegates.ControlDelegate;

namespace MediaWorld.Domain.Abstracts
{

  public abstract class AMedia : IControl 
  {
    public event ResultDelegate ResultEvent;
    public string Title {get; set;}
    public TimeSpan Duration {get; set;}
    public int FrameRate { get; set; }

    public AMedia()
    {

    }
    public abstract bool Forward();

    public abstract bool Rewind();

    public virtual bool Play()
    {
      int count = 0;
      if(ResultEvent == null)
      {
        return false;
      }

      while(count < 10)
      {
        Thread.Sleep(20);
        ResultEvent(this);
        count += 1;
      }

      return true;
    }

    public bool Stop()
    {
      throw new System.NotImplementedException();
    }

    public virtual bool Pause()
    {
      throw new System.NotImplementedException();
    }

    public override string ToString() 
    {
        return $"{this.Title}";
    }
  }
}