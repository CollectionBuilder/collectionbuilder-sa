# Jekyll Plugins

Jekyll is designed to be extensible via [plugins](https://jekyllrb.com/docs/plugins/) written in Ruby.
The code is kept in `_plugins` directory, and runs immediately as Jekyll starts.

CollectionBuilder-CONTENTdm uses two plugins:

- `data_page_generator.rb` - this plugin generates pages based on objects in a data file. It originated from [Adolfo Villafiorita jekyll-datapage_gen](https://github.com/avillafiorita/jekyll-datapage_gen), but was slightly modified for the purposed of CollectionBuilder (to provide an index number for the page used to calculate next/previous item for browse buttons on item pages). This is essential to create individual item pages on the fly from the collection metadata. It is configured in `_config.yml`. 
- `array_count_uniq.rb` - this plugin takes a Liquid array as input and returns a hash of the unique values and their counts. Use in a project like: `{{ myarray | array_count_uniq }}`. This allows you to quickly extract unique terms from large metadata files, which would take too long using Liquid. This was custom created for the CollectionBuilder project.

Keep in mind that plugins can not be used on GitHub Pages.
Thus, collectionbuilder-gh uses different means to generate items pages and unique counts, which are not efficient enough to handle the large collections that CollectionBuilder-CDM is designed to build.
