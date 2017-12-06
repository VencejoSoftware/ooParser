{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooParser.Intf;

interface

type
  IParser = interface
    ['{6D875C88-167B-4142-9D05-2053D98FC879}']
    function Evaluate(const Text: String): String;
  end;

implementation

end.
