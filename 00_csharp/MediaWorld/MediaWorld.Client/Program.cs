using System;
using MediaWorld.Domain.Abstracts;
using MediaWorld.Domain.Models;
//using MediaWorld.Domain.Singletons;


namespace MediaWorld.Client
{
  /// <summary>
  /// contains the start point
  /// </summary>
    class Program
    {
      /// <summary>
      /// starts the application
      /// </summary>
        private static void Main()
        {
            Play();
        }

        private static void Play()
        {
          var mediaPlayer = MediaPlayerSingleton.Instance;
          AMedia s = new Song();
          AMedia movie = new Movie();

          mediaPlayer.Execute("play", s);
          mediaPlayer.Execute("play", movie);
        }
    }
}
