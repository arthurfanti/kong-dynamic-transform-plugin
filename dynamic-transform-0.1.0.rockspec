package = "dynamic-transform"

version = "0.1.0"

-- The version '0.1.1' is the source code version, the trailing '1' is the version of this rockspec.
-- whenever the source version changes, the rockspec should be reset to 1. The rockspec version is only
-- updated (incremented) when this file changes, but the source remains the same.

supported_platforms = {"linux", "macosx"}

source = {
  url = "https://github.com/arthurfanti/kong-dynamic-transform-plugin",
  tag = "0.1.0"
}

description = {
  summary = "Set a flag on requests' header based on its origin.",
  license = "MIT"
}

dependencies = {
}

build = {
  type = "builtin",
  modules = {
    ["kong.plugins.dynamic-transform.access"] = "src/access.lua",
    ["kong.plugins.dynamic-transform.handler"] = "src/handler.lua",
    ["kong.plugins.dynamic-transform.schema"] = "src/schema.lua"
  }
}
