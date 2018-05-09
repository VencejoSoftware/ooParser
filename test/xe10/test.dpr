{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
program test;

uses
  ooRunTest,
  ooParser.Variable_test in '..\code\ooParser.Variable_test.pas',
  ooParser.Callback in '..\..\code\ooParser.Callback.pas',
  ooParser.Constant in '..\..\code\ooParser.Constant.pas',
  ooParser in '..\..\code\ooParser.pas',
  ooParser.Element.Intf in '..\..\code\ooParser.Element.Intf.pas',
  ooParser.ElementList in '..\..\code\ooParser.ElementList.pas',
  ooParser.Variable in '..\..\code\ooParser.Variable.pas',
  ooParser.Constant_test in '..\code\ooParser.Constant_test.pas',
  ooParser.Callback_test in '..\code\ooParser.Callback_test.pas',
  ooParser.ElementList_test in '..\code\ooParser.ElementList_test.pas';

{ R *.RES }

begin
  Run;

end.
