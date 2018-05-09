{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooParser.Constant_test;

interface

uses
  SysUtils,
  ooParser.Constant,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TParserConstTest = class sealed(TTestCase)
  published
    procedure NameIsConstant1;
    procedure ValueIsStaticText;
  end;

implementation

procedure TParserConstTest.NameIsConstant1;
begin
  CheckEquals('constant1', TParserConstant.New('constant1', 'static text').Name);
end;

procedure TParserConstTest.ValueIsStaticText;
begin
  CheckEquals('static text', TParserConstant.New('constant1', 'static text').Value);
end;

initialization

RegisterTest(TParserConstTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
