{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooParser.Callback;

interface

uses
  Classes, SysUtils,
  ooParser.Callback.Params;

type
  IParserCallback = interface
    ['{2A4A9E7C-E730-4FB4-B877-321A69C4A0B6}']
    function ParameterList: TCallbackParameterList;
    function Execute: String;
  end;

{$IFDEF FPC}
  TRefCallback = function(const Callback: IParserCallback): string;
{$ELSE}
  TRefCallback = reference to function(const Callback: IParserCallback): string;
{$ENDIF}

  TParserCallback = class sealed(TInterfacedObject, IParserCallback)
  strict private
    _RefCallback: TRefCallback;
    _CallbackParameterList: TCallbackParameterList;
  public
    function ParameterList: TCallbackParameterList;
    function Execute: String;

    constructor Create(const RefCallback: TRefCallback); virtual;
    destructor Destroy; override;

    class function New(const RefCallback: TRefCallback): IParserCallback;
  end;

implementation

function TParserCallback.ParameterList: TCallbackParameterList;
begin
  Result := _CallbackParameterList;
end;

function TParserCallback.Execute: String;
begin
  Result := _RefCallback(Self);
end;

constructor TParserCallback.Create(const RefCallback: TRefCallback);
begin
  _RefCallback := RefCallback;
  _CallbackParameterList := TCallbackParameterList.Create;
end;

destructor TParserCallback.Destroy;
begin
  _CallbackParameterList.Free;
  inherited;
end;

class function TParserCallback.New(const RefCallback: TRefCallback): IParserCallback;
begin
  Result := Create(RefCallback);
end;

end.
