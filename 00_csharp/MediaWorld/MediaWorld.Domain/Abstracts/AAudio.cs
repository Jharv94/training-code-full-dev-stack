using MediaWorld.Domain.Interfaces;

namespace MediaWorld.Domain.Abstracts
{

  public abstract class AAudio : AMedia 
  {
    public string Author {get; set;}
    public string Narrator {get; set;}
    public int PageCount {get; set;}
    public int BitRate {get; set;}

    public override bool Forward()
    {
      return true;
    }
    public override bool Rewind()
    {
      return true;
    }

    public override bool Play()
    {
      return true;
    }

    public new bool Stop()
    {
      return true;
    }

    public override string ToString() 
    {
        return $"{Title}, {Duration}| Author: {Author}, Narrator: {Narrator} Pagecount:{PageCount}, BitRate: {BitRate}";
    }
  }
}