using System;

using MediaWorld.Domain.Abstracts;
using MediaWorld.Domain.Interfaces;
using static MediaWorld.Domain.Delegates.ControlDelegate;

namespace MediaWorld.Domain.Singletons
{

  public class MediaPlayerSingleton : IPlayer
  {
    //sets instance of MediaPlayerSingleton to sttatic
    private static readonly MediaPlayerSingleton _instance = new MediaPlayerSingleton();
    
    private MediaPlayerSingleton(){}
    
    //Getter method for the instance which is why it's static
    //and other methods are not
    public static MediaPlayerSingleton Instance
    {
      get
      {
        return _instance;
      }
    }

    public bool Execute(ButtonDelegate button, AMedia media)
    {
      media.ResultEvent += ResultHandler;
      return button();
    }

    public void ResultHandler(AMedia media)
    {
      Console.WriteLine("{0} is Playing...", media.Title);
    }

    public bool VolumeUp()
    {
      return true;
    }

    public bool VolumeDown()
    {
      return true;
    }

    public bool VolumeMute()
    {
      return true;
    }

    public bool PowerUp()
    {
      return true;
    }

    public bool PowerDown()
    {
      return true;
    }
  }
}