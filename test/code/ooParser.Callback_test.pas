{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooParser.Callback_test;

interface

uses
  SysUtils,
  ooParser.Constant,
  ooParser.Element.Intf,
  ooParser.Callback,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TParserCallbackTest = class sealed(TTestCase)
  published
    procedure CallbackWithoutParamsReturnTextOne;
    procedure CallbackWithParamsReturnTextOneTwoABC;
  end;

implementation

function TestTagCallback(const Callback: IParserCallback): string;
var
  Element: IParserElement;
begin
  Result := 'text one';
  for Element in Callback.Parameters do
    Result := Result + Element.Value;
end;

procedure TParserCallbackTest.CallbackWithoutParamsReturnTextOne;
begin
  CheckEquals('text one', TParserCallback.New(TestTagCallback).Execute);
end;

procedure TParserCallbackTest.CallbackWithParamsReturnTextOneTwoABC;
var
  ParserCallback: IParserCallback;
begin
  ParserCallback := TParserCallback.New(TestTagCallback);
  ParserCallback.Parameters.Add(TParserConstant.New('const1', 'Two'));
  ParserCallback.Parameters.Add(TParserConstant.New('const2', 'ABC'));
  CheckEquals('text oneTwoABC', ParserCallback.Execute);
end;

initialization

RegisterTest(TParserCallbackTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
