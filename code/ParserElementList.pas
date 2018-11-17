{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Parser element list
  @created(09/05/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ParserElementList;

interface

uses
  SysUtils,
  List, IterableList,
  ParserElement;

type
{$REGION 'documentation'}
{
  @abstract(Parser element list interface)
  @member(
    FindByName Search element in list by name
    @param(Name Name identifier to find)
    @return(@link(IParserElement Parser element))
  )
}
{$ENDREGION}
  IParserElementList<T: IParserElement> = interface(IIterableList<T>)
    ['{28792FE4-9EB2-42BB-BEDA-43883A79DCD3}']
    function FindByName(const Name: string): T;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IParserElementList))
  @member(FindByName @seealso(IParserElementList.FindByName))
  @member(
    New Create a new @classname as interface
  )
}
{$ENDREGION}

  TParserElementList<T: IParserElement> = class sealed(TIterableList<T>, IParserElementList<T>)
  public
    function FindByName(const Name: string): T;
    class function New: IParserElementList<T>;
  end;

implementation

function TParserElementList<T>.FindByName(const Name: string): T;
var
  Element: T;
begin
  Result := default (T);
  for Element in Self do
    if CompareText(Element.Name, Name) = 0 then
      Exit(Element);
end;

class function TParserElementList<T>.New: IParserElementList<T>;
begin
  Result := TParserElementList<T>.Create;
end;

end.
