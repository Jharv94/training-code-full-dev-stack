namespace MediaWorld.Domain.Interfaces
{
  public interface IControl
  {

    bool Forward();
    
    bool Play();

    bool Pause();

    bool Stop();

    bool Rewind();

  }

}