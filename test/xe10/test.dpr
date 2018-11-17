{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
program test;

uses
  RunTest,
  ParserCallback in '..\..\code\ParserCallback.pas',
  ParserConstant in '..\..\code\ParserConstant.pas',
  Parser in '..\..\code\Parser.pas',
  ParserElement in '..\..\code\ParserElement.pas',
  ParserElementList in '..\..\code\ParserElementList.pas',
  ParserVariable in '..\..\code\ParserVariable.pas',
  ParserVariable_test in '..\code\ParserVariable_test.pas',
  ParserConstant_test in '..\code\ParserConstant_test.pas',
  ParserCallback_test in '..\code\ParserCallback_test.pas',
  ParserElementList_test in '..\code\ParserElementList_test.pas';

{R *.RES}

begin
  Run;

end.
