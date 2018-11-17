{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ParserElementList_test;

interface

uses
  SysUtils,
  ParserConstant,
  ParserElement,
  ParserElementList,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TParserElementListTest = class sealed(TTestCase)
  strict private
    _List: IParserElementList<IParserElement>;
  protected
    procedure SetUp; override;
  published
    procedure FindByNameTag1ReturnItem2;
    procedure FindByNameTagNonExistReturnNil;
  end;

implementation

procedure TParserElementListTest.FindByNameTag1ReturnItem2;
var
  Element: IParserElement;
begin
  Element := _List.FindByName('tag1');
  CheckEquals('tag 1 value', Element.Value);
end;

procedure TParserElementListTest.FindByNameTagNonExistReturnNil;
var
  Element: IParserElement;
begin
  Element := _List.FindByName('NonExist');
  CheckFalse(Assigned(Element));
end;

procedure TParserElementListTest.SetUp;
begin
  inherited;
  _List := TParserElementList<IParserElement>.New;
  _List.Add(TParserConstant.New('tag1', 'tag 1 value'));
  _List.Add(TParserConstant.New('const2', 'ABC'));
end;

initialization

RegisterTest(TParserElementListTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
