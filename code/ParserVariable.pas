{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Parser variable
  @created(09/05/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ParserVariable;

interface

uses
  SysUtils,
  ParserCallback,
  ParserElement;

type
{$REGION 'documentation'}
{
  @abstract(Parser variable interface)
  @member(ChangeValue Change static value)
}
{$ENDREGION}
  IParserVariable = interface(IParserElement)
    ['{57B1DACF-0F1B-441F-BAF8-1556BC12D0B8}']
    procedure ChangeValue(const Value: String);
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IParserVariable))
  @member(Name @seealso(IParserElement.Name))
  @member(Value @seealso(IParserElement.Value))
  @member(ChangeValue @seealso(IParserVariable.ChangeValue))
  @member(
    Create Object constructor
    @param(Name Constant name)
    @param(Callback Callback to obtain dynamic value)
  )
  @member(
    New Create a new @classname as interface
    @param(Name Constant name)
    @param(Callback Callback to obtain dynamic value)
  )
}
{$ENDREGION}

  TParserVariable = class sealed(TInterfacedObject, IParserVariable, IParserElement)
  strict private
    _Name, _Value: String;
    _Callback: IParserCallback;
  public
    function Name: String;
    function Value: String;
    procedure ChangeValue(const Value: String);
    constructor Create(const Name: String; const Callback: IParserCallback); virtual;
    class function New(const Name: String; const Callback: IParserCallback = nil): IParserVariable; overload;
  end;

implementation

function TParserVariable.Name: String;
begin
  Result := _Name;
end;

function TParserVariable.Value: String;
begin
  if Assigned(_Callback) then
    Result := _Callback.Execute
  else
    Result := _Value;
end;

procedure TParserVariable.ChangeValue(const Value: String);
begin
  _Value := Value;
end;

constructor TParserVariable.Create(const Name: String; const Callback: IParserCallback);
begin
  _Name := Name;
  _Value := EmptyStr;
  _Callback := Callback;
end;

class function TParserVariable.New(const Name: String; const Callback: IParserCallback): IParserVariable;
begin
  Result := TParserVariable.Create(Name, Callback);
end;

end.
