{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooParser.Item.Intf;

interface

type
  IParserItem = interface
    ['{1E9588AC-DFBE-4635-831C-0BEBC1E43B77}']
    function Name: String;
    function Value: String;
  end;

implementation

end.
