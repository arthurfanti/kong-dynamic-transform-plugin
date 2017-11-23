local find = string.find
-- entries must have colons to set the key and value apart
local function check_for_value(value)
  for i, entry in ipairs(value) do
    local ok = find(entry, ":")
    if not ok then
      return false, "key '" .. entry .. "' has no value"
    end
  end
  return true
end

return {
  no_consumer = true,
  fields = {
    origin = {required = true, type = "string"},
    flag = {required = true, type = "array", default = {}, func = check_for_value}
  }
}
