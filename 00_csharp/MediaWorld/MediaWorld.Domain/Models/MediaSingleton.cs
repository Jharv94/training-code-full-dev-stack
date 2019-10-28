using System;

using MediaWorld.Domain.Abstracts;
using MediaWorld.Domain.Interfaces;

namespace MediaWorld.Domain.Models
{

  public class MediaPlayerSingleton : IPlayer
  {
    private static readonly MediaPlayerSingleton _instance = new MediaPlayerSingleton();

    private MediaPlayerSingleton(){}
    public static MediaPlayerSingleton Instance
    {
      get
      {
        return _instance;
      }
    }

    public void Execute(string command, AMedia media)
    {
      System.Console.WriteLine(media);
    }
  }
}