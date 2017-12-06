{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooParser.Item.List;

interface

uses
  SysUtils,
  Generics.Collections,
  ooParser.Item.Intf;

type
  IParserItemList<T: IParserItem> = interface
    ['{28792FE4-9EB2-42BB-BEDA-43883A79DCD3}']
    function FindByName(const Name: string): T;
    function Add(const Item: T): Integer;
    function Count: Integer;
    function Item(const Index: Integer): T;

    procedure Clear;
  end;

  TParserItemList<T: IParserItem> = class(TInterfacedObject, IParserItemList<T>)
  strict private
  type
    _TParserList = TList<T>;
  strict private
    _List: _TParserList;
  public
    function FindByName(const Name: string): T; inline;
    function ValueByName(const Name: string): String;
    function Add(const Item: T): Integer;
    function Count: Integer;
    function Item(const Index: Integer): T;

    procedure Clear;

    constructor Create; virtual;
    destructor Destroy; override;

    class function New: IParserItemList<T>;
  end;

implementation

function TParserItemList<T>.FindByName(const Name: string): T;
var
  ParserItem: T;
begin
  Result := default(T);
  for ParserItem in _List do
  begin
    if CompareText(ParserItem.Name, Name) = 0 then
    begin
      Result := ParserItem;
      Break;
    end;
  end;
end;

function TParserItemList<T>.Item(const Index: Integer): T;
begin
  Result := _List.Items[Index];
end;

function TParserItemList<T>.ValueByName(const Name: string): String;
var
  ParserItem: IParserItem;
begin
  ParserItem := FindByName(Name);
  if Assigned(ParserItem) then
    Result := ParserItem.Value
  else
    Result := EmptyStr;
end;

function TParserItemList<T>.Add(const Item: T): Integer;
begin
  Result := _List.Add(Item);
end;

procedure TParserItemList<T>.Clear;
begin
  _List.Clear;
end;

function TParserItemList<T>.Count: Integer;
begin
  Result := _List.Count;
end;

constructor TParserItemList<T>.Create;
begin
  _List := _TParserList.Create;
end;

destructor TParserItemList<T>.Destroy;
begin
  _List.Free;
  inherited;
end;

class function TParserItemList<T>.New: IParserItemList<T>;
begin
  Result := TParserItemList<T>.Create;
end;

end.
