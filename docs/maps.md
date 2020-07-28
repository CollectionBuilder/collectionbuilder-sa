# Map visualization

Powered by Leaflet.js, https://github.com/Leaflet/Leaflet

With plugins: 

- search, https://github.com/naomap/leaflet-fusesearch
- cluster, https://github.com/Leaflet/Leaflet.markercluster
- cluster plugin (for search and cluster to work together), https://github.com/ghybs/Leaflet.MarkerCluster.Freezable

Set base configuration in `_data/theme.yml` map section, including:

```
latitude: 46.727485 #to determine center of map
longitude: -117.014185 #to determine center of map
zoom-level: 5 # zoom level for map 
map-search: true # not suggested with large collections
map-search-fuzziness: 0.35 # fuzzy search range from 1 = anything to 0 = exact match only
map-cluster: true # suggested for large collection or with many items in same location
map-cluster-radius: 25 # size of clusters, from ~ 10 to 80
```

These `theme` options will load the correct CSS and JS for leaflet features, while setting some JS configuration variables. 
`map-cluster-radius` sets the `maxClusterRadius` which corresponds to the maximum radius a cluster can cover in pixels on the map.
A smaller radius will create more, smaller clusters, and increasing will create fewer, larger clusters on the map.

Next, configure the display using `_data/map-config.csv`, which controls the metadata displayed on object popups and included in search:

- `field`: matches a column name in the metadata csv that will be displayed in object popups.
- `display`: display name for the field to appear on popup. if blank, field will not be displayed (but could be used in search)
- `search`: `true` or `false`/blank. If theme has `map-search` as `true`, then fields with true in this column will be indexed and displayed on the map search feature.

Because of the way markers are handled, for larger collections it is strongly suggested to turn search off and cluster on.
Cluster makes loading and navigating the map significantly more efficient.

Object pages that have lat/long will generate a "View on Map" button link. 
These link to the `map.html` page with a hash value, for example: 
`/map.html#46.727485,-117.014185`.
If the url includes a hash, it will be parsed and set as the map view box with full zoom.
