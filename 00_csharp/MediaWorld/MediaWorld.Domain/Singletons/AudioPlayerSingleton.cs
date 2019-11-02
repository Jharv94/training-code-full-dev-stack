using MediaWorld.Domain.Interfaces;

namespace MediaWorld.Domain.Singletons
{
  /// <summary>
  /// contains the singleton pattern
  /// </summary>
  public class AudioPlayerSingleton : IPlayer 
  {
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
