require "./g_object/wrapped_type"

module GObject
  LOADED_NAMESPACES = [] of String
end

macro require_gobject(namespace)
  {% unless GObject::LOADED_NAMESPACES.includes?(namespace) %}
    {% GObject::LOADED_NAMESPACES << namespace %}
    {{run "gobject/generator/build_namespace", namespace}}
  {% end %}
end