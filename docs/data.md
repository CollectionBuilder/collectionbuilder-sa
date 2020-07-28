# Data export

CollectionBuilder uses Jekyll to generate specialized derivatives of your metadata to consume for visualizations, and to expose for others to download.

Data used by the website and available for download is in the `data/` directory.

Data used by the visualizations is usually specialized and optimized for page load, thus limited to the exact fields and information used by the specific page consuming it.

Since this data is not easy to understand or reuse, CollectionBuilder also generates more complete versions for others to consume. 

The `/data/metadata.csv`, `/data/metadata.json`, and `/data/geodata.json` data downloads are driven by the `site.data.theme.metadata-export-fields`. 
This means the CSV/JSON download can be more complete, containing more fields than are displayed anywhere on the site.

Other data derivatives are provided to explore and quantify collection content.
`facets.json` can summarize the unique value counts of metadata fields. 
The fields evaluated by `facets.json` is configured using `site.data.theme.metadata-facets-fields`.
The `subjects.json`, `subjects.csv`, `locations.csv` and `locations.json` use the same routine to generate commonly used facets, plus links to the collection's browse page to explore them.
The fields used are configured in `site.data.theme.subjects-fields` and `site.data.theme.locations-fields`.

`timelinejs.json` is a time-focused format designed to work with the standalone version of Knight Lab's [TimelineJS](http://timeline.knightlab.com/).

A link to the source code repository will be included if `source-code` is set in _config.yml, otherwise it will link to CollectionBuilder.
