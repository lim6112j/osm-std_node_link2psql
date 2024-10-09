# [osm to psql for ETA](https://osm2pgsql.org/examples/buildings)

* process

1. download south-korea-latest.osm.pbf

2. open openstreetmap with browser and download small area xml(yeoido island) - yeoido.osm

3. install osmium with homebrew

4. osmium extract -p yeoido.osm -o yeoido.osm.pbf south-korea-latest.osm.pbf

5. make lua script, buildings.lua

6. install osm2pgsql with homebrew

7. postgresql setting

byeongcheollim=# CREATE SCHEMA postgis;
CREATE SCHEMA
byeongcheollim=# CREATE EXTENSION postgis SCHEMA postgis;
CREATE EXTENSION
byeongcheollim=# CREATE EXTENSION postgis_raster SCHEMA postgis;
CREATE EXTENSION
byeongcheollim=# ALTER DATABASE byeongcheollim SET search_path=public,postgis;
ALTER DATABASE
byeongcheollim=# \c byeongcheollim
You are now connected to database "byeongcheollim" as user "byeongcheollim".
byeongcheollim=# SELECT postgis_full_version()

8. download qgis for testing postgresql

9. osm2pgsql -d byeongcheollim -O flex -S buildings.lua yeoido.osm.pbf

10. open qgis connect postgresql , db = byeongcheollim, click public table, you can look the yeoido map

