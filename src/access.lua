local get_headers = ngx.req.get_headers
local get_uri_args = ngx.req.get_uri_args
local get_body = ngx.req.get_body_data

local _M = {}

local HOST = "host"

function _M.execute(conf)
  local origin = conf.origin
  local flag = conf.flag

  -- Add header(s)
  for _, name, value in iter(conf.flag) do
    if req_get_headers()['Origin'] == conf.origin then
      req_set_header(name, value)
      if name:lower() == HOST then -- Host header has a special treatment
        ngx.var.upstream_host = value
      end
    end
  end
end

return _M
