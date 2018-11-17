{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ParserVariable_test;

interface

uses
  SysUtils,
  ParserVariable,
  ParserConstant,
  ParserCallback,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TParserVariableTest = class sealed(TTestCase)
  published
    procedure TestName;
    procedure TestValue;
    procedure TestCallback;
    procedure TestCallbackParam;
    procedure TestCallbackParamChange;
  end;

implementation

function TestTagCallback(const Callback: IParserCallback): string;
begin
  Result := 'text one';
end;

procedure TParserVariableTest.TestName;
begin
  CheckEquals('tag1', TParserVariable.New('tag1').Name);
end;

procedure TParserVariableTest.TestValue;
var
  ParserVariable: IParserVariable;
begin
  ParserVariable := TParserVariable.New('tag1');
  ParserVariable.ChangeValue('text one');
  CheckEquals('text one', ParserVariable.Value);
end;

procedure TParserVariableTest.TestCallback;
var
  ParserVariable: IParserVariable;
begin
  ParserVariable := TParserVariable.New('tag1', TParserCallback.New(TestTagCallback));
  CheckEquals('text one', ParserVariable.Value);
end;

function TestTagCallbackParam(const aCallBack: IParserCallback): string;
begin
  Result := 'text one' + aCallBack.Parameters.FindByName('param1').Value;
end;

procedure TParserVariableTest.TestCallbackParam;
var
  ParserVariable: IParserVariable;
  ParserCallback: IParserCallback;
begin
  ParserCallback := TParserCallback.New(TestTagCallbackParam);
  ParserCallback.Parameters.Add(TParserConstant.New('PARAM1', ' line two'));
  ParserVariable := TParserVariable.New('tag1', ParserCallback);
  CheckEquals('text one line two', ParserVariable.Value);
end;

function TestTagCallbackParamChange(const aCallBack: IParserCallback): string;
begin
  Result := 'text one' + aCallBack.Parameters.FindByName('param1').Value;
end;

procedure TParserVariableTest.TestCallbackParamChange;
var
  ParserVariable: IParserVariable;
  ParserCallback: IParserCallback;
begin
  ParserCallback := TParserCallback.New(TestTagCallbackParamChange);
  ParserCallback.Parameters.Add(TParserConstant.New('PARAM1', ' line two'));
  ParserVariable := TParserVariable.New('tag1', ParserCallback);
  ParserCallback.Parameters.Clear;
  ParserCallback.Parameters.Add(TParserConstant.New('param1', ' 1234.'));
  CheckEquals('text one 1234.', ParserVariable.Value);
end;

initialization

RegisterTest(TParserVariableTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
