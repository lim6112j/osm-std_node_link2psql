local buildings = osm2pgsql.define_area_table('buildings', {
  {column = 'id', sql_type = 'serial', create_only = true},
  {column = 'geom', type = 'polygon', not_null = true},
}, { indexes = {
  {column = 'id', method = 'btree', unique = true},
  {column = 'geom', method = 'gist'}
}})
function osm2pgsql.process_way(object)
  if object.is_closed and object.tags.building then
  buildings:insert({
    geom = object:as_polygon()
  })
  end
end
function osm2pgsql.process_relation(object)
  if object.tags.type == 'multipolygon' and object.tags.building then
    local mp = object:as_multipolygon()
    for geom in mp:geometries() do
      buildings:insert({
        geom = geom
      })
    end
  end
end
