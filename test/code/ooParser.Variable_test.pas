{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooParser.Variable_test;

interface

uses
  SysUtils,
  ooParser.Variable,
  ooParser.Constant,
  ooParser.Callback,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TParserVariableTest = class(TTestCase)
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

procedure TParserVariableTest.TestCallback;
var
  ParserVariable: IParserVariable;
begin
  ParserVariable := TParserVariable.New('tag1', TParserCallback.New(TestTagCallback));
  CheckEquals('text one', ParserVariable.Value);
end;

function TestTagCallbackParam(const aCallBack: IParserCallback): string;
begin
  Result := 'text one' + aCallBack.ParameterList.FindByName('param1').Value;
end;

procedure TParserVariableTest.TestCallbackParam;
var
  ParserVariable: IParserVariable;
  ParserCallback: IParserCallback;
begin
  ParserCallback := TParserCallback.New(TestTagCallbackParam);
  ParserCallback.ParameterList.Add(TParserConstant.New('PARAM1', ' line two'));
  ParserVariable := TParserVariable.New('tag1', ParserCallback);
  CheckEquals('text one line two', ParserVariable.Value);
end;

function TestTagCallbackParamChange(const aCallBack: IParserCallback): string;
begin
  Result := 'text one' + aCallBack.ParameterList.FindByName('param1').Value;
end;

procedure TParserVariableTest.TestCallbackParamChange;
var
  ParserVariable: IParserVariable;
  ParserCallback: IParserCallback;
begin
  ParserCallback := TParserCallback.New(TestTagCallbackParamChange);
  ParserCallback.ParameterList.Add(TParserConstant.New('PARAM1', ' line two'));
  ParserVariable := TParserVariable.New('tag1', ParserCallback);
  ParserCallback.ParameterList.Clear;
  ParserCallback.ParameterList.Add(TParserConstant.New('param1', ' 1234.'));
  CheckEquals('text one 1234.', ParserVariable.Value);
end;

procedure TParserVariableTest.TestName;
var
  ParserVariable: IParserVariable;
begin
  ParserVariable := TParserVariable.New('tag1', 'text one');
  CheckEquals('tag1', ParserVariable.Name);
end;

procedure TParserVariableTest.TestValue;
var
  ParserVariable: IParserVariable;
begin
  ParserVariable := TParserVariable.New('tag1', 'text one');
  CheckEquals('text one', ParserVariable.Value);
end;

initialization

RegisterTest(TParserVariableTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
