{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Parser callback
  @created(09/05/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ParserCallback;

interface

uses
  Classes, SysUtils,
  ParserElement, ParserElementList;

type
{$REGION 'documentation'}
{
  @abstract(Parser element callback interface)
  @member(Parameters List of parameters used in callback)
  @member(Execute Run callback and return value)
}
{$ENDREGION}
  IParserCallback = interface
    ['{2A4A9E7C-E730-4FB4-B877-321A69C4A0B6}']
    function Parameters: IParserElementList<IParserElement>;
    function Execute: String;
  end;

{$REGION 'documentation'}
{
  @abstract(External callback function reference to execute )
  @param(Callback Parser callback object to execute)
}
{$ENDREGION}
{$IFDEF FPC}

  TCallbackFunction = function(const Callback: IParserCallback): string;
{$ELSE}
  TCallbackFunction = reference to function(const Callback: IParserCallback): string;
{$ENDIF}
{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IParserCallback))
  @member(Parameters @seealso(IParserCallback.Parameters))
  @member(Execute @seealso(IParserCallback.Execute))
  @member(
    Create Object constructor
    @param(CallbackFunction External reference to callback mehtod)
  )
  @member(
    New Create a new @classname as interface
    @param(CallbackFunction External reference to callback mehtod)
  )
}
{$ENDREGION}

  TParserCallback = class sealed(TInterfacedObject, IParserCallback)
  strict private
    _Callback: TCallbackFunction;
    _Parameters: IParserElementList<IParserElement>;
  public
    function Parameters: IParserElementList<IParserElement>;
    function Execute: String;
    constructor Create(const Callback: TCallbackFunction); virtual;
    class function New(const Callback: TCallbackFunction): IParserCallback;
  end;

implementation

function TParserCallback.Parameters: IParserElementList<IParserElement>;
begin
  Result := _Parameters;
end;

function TParserCallback.Execute: String;
begin
  Result := _Callback(Self);
end;

constructor TParserCallback.Create(const Callback: TCallbackFunction);
begin
  _Callback := Callback;
  _Parameters := TParserElementList<IParserElement>.New;
end;

class function TParserCallback.New(const Callback: TCallbackFunction): IParserCallback;
begin
  Result := TParserCallback.Create(Callback);
end;

end.
