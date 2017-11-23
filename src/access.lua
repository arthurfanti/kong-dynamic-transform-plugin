local req_get_headers = ngx.req.get_headers
local req_set_header = ngx.req.set_header

local _M = {}

local HOST = "host"

local function iter(config_array)
  return function(config_array, i, previous_name, previous_value)
    i = i + 1
    local current_pair = config_array[i]
    if current_pair == nil then -- n + 1
      return nil
    end

    local current_name, current_value = current_pair:match("^([^:]+):*(.-)$")
    if current_value == "" then
      current_value = nil
    end

    return i, current_name, current_value
  end, config_array, 0
end

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
