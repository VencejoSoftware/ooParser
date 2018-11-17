{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Text parser
  @created(09/05/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit Parser;

interface

type
{$REGION 'documentation'}
{
  @abstract(Text parser interface)
  @member(
    Evaluate Evaluate text and run parser
    @param(Text Text to parse)
    @return(Text parser)
  )
}
{$ENDREGION}
  IParser = interface
    ['{6D875C88-167B-4142-9D05-2053D98FC879}']
    function Evaluate(const Text: String): String;
  end;

implementation

end.
