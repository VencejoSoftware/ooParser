{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooParser.Variable;

interface

uses
  SysUtils,
  ooParser.Callback,
  ooParser.Item.Intf;

type
  IParserVariable = interface(IParserItem)
    ['{57B1DACF-0F1B-441F-BAF8-1556BC12D0B8}']
    function Callback: IParserCallback;

    procedure ChangeStaticValue(const Value: String);
  end;

  TParserVariable = class sealed(TInterfacedObject, IParserVariable, IParserItem)
  strict private
    _Name, _StaticValue: String;
    _Callback: IParserCallback;
  public
    function Name: String;
    function Value: String;
    function Callback: IParserCallback;

    procedure ChangeStaticValue(const Value: String);

    constructor Create(const Name, StaticValue: String; const Callback: IParserCallback); virtual;

    class function New(const Name: String; const Callback: IParserCallback): IParserVariable; overload;
    class function New(const Name, StaticValue: String): IParserVariable; overload;
  end;

implementation

function TParserVariable.Name: String;
begin
  Result := _Name;
end;

function TParserVariable.Value: String;
begin
  if Assigned(_Callback) then
    Result := Callback.Execute
  else
    Result := _StaticValue;
end;

function TParserVariable.Callback: IParserCallback;
begin
  Result := _Callback;
end;

procedure TParserVariable.ChangeStaticValue(const Value: String);
begin
  _StaticValue := Value;
end;

constructor TParserVariable.Create(const Name, StaticValue: String; const Callback: IParserCallback);
begin
  _Name := Name;
  _StaticValue := StaticValue;
  _Callback := Callback;
end;

class function TParserVariable.New(const Name: String; const Callback: IParserCallback): IParserVariable;
begin
  Result := Create(Name, EmptyStr, Callback);
end;

class function TParserVariable.New(const Name, StaticValue: String): IParserVariable;
begin
  Result := Create(Name, StaticValue, nil);
end;

end.
