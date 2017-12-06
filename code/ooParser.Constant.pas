{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooParser.Constant;

interface

uses
  ooParser.Item.Intf;

type
  IParserConstant = interface(IParserItem)
    ['{D86A1426-894D-4DEF-9FB3-9807403EAA18}']
  end;

  TParserConstant = class sealed(TInterfacedObject, IParserConstant, IParserItem)
  strict private
    _Name, _Value: String;
  public
    function Name: String;
    function Value: String;

    constructor Create(const Name, Value: String); virtual;

    class function New(const Name, Value: String): IParserConstant;
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

class function TParserConstant.New(const Name, Value: String): IParserConstant;
begin
  Result := Create(Name, Value);
end;

end.
