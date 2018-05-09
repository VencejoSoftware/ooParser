{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Parser constant
  @created(09/05/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooParser.Constant;

interface

uses
  ooParser.Element.Intf;

type
{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IParserElement))
  Constant element for parser
  @member(Name @seealso(IParserElement.Name))
  @member(Value @seealso(IParserElement.Value))
  @member(
    Create Object constructor
    @param(Name Constant name)
    @param(Value Constant value)
  )
  @member(
    New Create a new @classname as interface
    @param(Name Constant name)
    @param(Value Constant value)
  )
}
{$ENDREGION}
  TParserConstant = class sealed(TInterfacedObject, IParserElement)
  strict private
    _Name, _Value: String;
  public
    function Name: String;
    function Value: String;
    constructor Create(const Name, Value: String); virtual;
    class function New(const Name, Value: String): IParserElement;
  end;

implementation

function TParserConstant.Name: String;
begin
  Result := _Name;
end;

function TParserConstant.Value: String;
begin
  Result := _Value;
end;

constructor TParserConstant.Create(const Name, Value: String);
begin
  _Name := Name;
  _Value := Value;
end;

class function TParserConstant.New(const Name, Value: String): IParserElement;
begin
  Result := Create(Name, Value);
end;

end.
