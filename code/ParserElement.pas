{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Parser element
  @created(09/05/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ParserElement;

interface

type
{$REGION 'documentation'}
{
  @abstract(Parser element interface)
  @member(Name Name identifier)
  @member(Value Element content)
}
{$ENDREGION}
  IParserElement = interface
    ['{1E9588AC-DFBE-4635-831C-0BEBC1E43B77}']
    function Name: String;
    function Value: String;
  end;

implementation

end.
