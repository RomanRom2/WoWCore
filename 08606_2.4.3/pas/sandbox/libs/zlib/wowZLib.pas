unit wowZLib;

interface

uses
  ZLibpas, ZInflate, ZDeflate;

const
  wowZ_OK = Z_OK;
  wowZ_STREAM_END = Z_STREAM_END;
  wowZ_NEED_DICT = Z_NEED_DICT;
  wowZ_ERRNO = Z_ERRNO;
  wowZ_STREAM_ERROR = Z_STREAM_ERROR;
  wowZ_DATA_ERROR = Z_DATA_ERROR;
  wowZ_MEM_ERROR = Z_MEM_ERROR;
  wowZ_BUF_ERROR = Z_BUF_ERROR;
  wowZ_VERSION_ERROR = Z_VERSION_ERROR;

function ZLibErrorCodeStr(code: longint): string;
function wowDezip(input_buffer_addr: pointer; in_count: longint; output_buffer_addr: pointer; var out_count: longint): longint;
function wowDozip(input_buffer_addr: pointer; in_count: longint; output_buffer_addr: pointer; var out_count: longint): longint;

implementation

var
  err: longint;
  z: z_stream;

function ZLibErrorCodeStr(code: longint): string;
begin
  case code of
    Z_OK            : result:= 'Z_OK';
    Z_STREAM_END    : result:= 'Z_STREAM_END';
    Z_NEED_DICT     : result:= 'Z_NEED_DICT';
    Z_ERRNO         : result:= 'Z_ERRNO';
    Z_STREAM_ERROR  : result:= 'Z_STREAM_ERROR';
    Z_DATA_ERROR    : result:= 'Z_DATA_ERROR';
    Z_MEM_ERROR     : result:= 'Z_MEM_ERROR';
    Z_BUF_ERROR     : result:= 'Z_BUF_ERROR';
    Z_VERSION_ERROR : result:= 'Z_VERSION_ERROR';
  end;
end;
function wowDezip(input_buffer_addr: pointer; in_count: longint; output_buffer_addr: pointer; var out_count: longint): longint;
begin
  wowDezip:= 0;

  z.zalloc:= NIL;
  z.zfree:= NIL;
  z.opaque:= NIL;
  err:= inflateInit(z);
  if err <> Z_OK then
  begin
    wowDezip:= err;
    exit;
  end;

  z.avail_in:= in_count;
  z.next_in:= input_buffer_addr;
  z.next_out:= output_buffer_addr;
  z.avail_out:= 1024*256;
  err:= inflate(z, Z_NO_FLUSH);

  if (err <> Z_OK) and (err <> Z_STREAM_END) then
  begin
    wowDezip:= err;
    inflateEnd(z);
    exit;
  end;

  inflateEnd(z);
  out_count:= z.total_out;
end;
function wowDozip(input_buffer_addr: pointer; in_count: longint; output_buffer_addr: pointer; var out_count: longint): longint;
begin
  wowDozip:= 0;

  z.zalloc:= NIL;
  z.zfree:= NIL;
  z.opaque:= NIL;
  err:= deflateInit(z,1);
  if err <> Z_OK then
  begin
    wowDozip:= err;
    exit;
  end;

  z.avail_in:= in_count;
  z.next_in:= input_buffer_addr;
  z.next_out:= output_buffer_addr;
  z.avail_out:= 1024*256;
  err:= deflate(z, Z_FINISH);

  if (err <> Z_OK) and (err <> Z_STREAM_END) then
    begin
      wowDozip:= err;
      deflateEnd(z);
      exit;
    end;

  deflateEnd(z);
  out_count:= z.total_out;
end;

end.
