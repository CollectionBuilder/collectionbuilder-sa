# Item pages

CollectionBuilder-CONTENTdm uses `data_page_generator.rb` plugin to generate individual pages for each item in the collection metadata on the fly.
Page gen options are configured in `_config.yml`, with the block:

```
page_gen:
  - data: 'demo_psychiana'
    template: 'item'
    name: 'objectid'
    dir: 'items'
    extension: 'html' 
    filter: 'objectid'  
```

The values correspond to:

- `data`: the name of the metadata file in `_data`, which should be the same as the value given for `metadata:` in _config.yml just above the page_gen config block.
- `template`: the name of the layout in `_layouts`, which is normally 'items'. *Note:* the "items" layout has no content, but passes the page information to the "item" layout (see below for more info).
- `name`: the metadata field used to create the filename, this should be objectid. Keep in mind this means your objectids will be URLs, so should be fully sanitized names with no spaces.
- `dir`: the directly where you want the pages to be output, i.e. where they will be on the website. CollectionBuilder expects them to be in /items/
- `extension`: should be html, since we are creating web pages directly using html.
- `filter`: used to skip rows of the metadata for page generation. Should be 'objectid', meaning if an item in the metadata does not have an objectid it will not become a page. This filter is used in other CollectionBuilder visualizations as well.

Page_gen passes all metadata fields through to Jekyll as if each was front matter on a normal file.
This page object is passed to the specified layout to give it form in a template.
Because page_gen rewrites the page object front matter, additional front matter added to the layout configured with `template` is lost. 
To avoid this issue, we use a dummy layout "items" which simply passes everything to the real layout "item" (_layouts/item.html).

The item layout uses the properties of the the metadata to create the item page contents, configured by "_data/config-metadata.csv". 
Item pages have a special meta markup in head (_includes/head/item-meta.html) which is also configured by config-metadata and driven by the metadata fields (see "docs/markup.md").
The image representations and object downloads logic is based on the `format` field in the metadata--thus will be incorrect if the format field is wrong or malformed.  

For image items, a zoomable, full screen gallery view is added using [lightGallery](http://sachinchoolur.github.io/lightGallery/).
The lightGallery dependencies are added by including `gallery: true` in the item layout front matter.
See docs/lightgallery.md for more details.

## Metadata display

The metadata fields displayed on an item page are configured by config-metadata. 

Only fields with a value in the "display_name" column will be displayed, and only if the item has a value for that field. 
(*Note:* if you want a field to display without a field name visible, enter a blank space in the "display_name" column)

Fields with "true" in the "browse_link" column in config-metadata will generate a link to the Browse page. 
Values in "browse_link" fields will be split on semicolon `;` as multi-valued fields before adding links.
These often mirror the "btn" links on the Browse config-browse. 
Keep in mind that for the browse links to be useful, the field must also be available to filter on the Browse page--so the field should appear in config-browse (displayed, btn, or hidden). 

## Preferred Citation 

At the bottom of the item page, a "Preferred Citation" is automatically generated using the item title (metadata title), collection (site.title), organization (site.organization-name), and a link to the item page.
To use a different format, please edit the card in the item layout.

## Rights

At the bottom of the item page a "Rights" box is automatically generated if either "rights" or "rightsstatement" field is in the metadata.
The layout assumes that "rightsstatement" is a link only, e.g. most likely from rightsstatements.org or Creative Commons, a value such as "http://rightsstatements.org/vocab/NoC-US/1.0/".
If your collection uses different field names for these values, either modify the field names in the metadata CSV, or edit the Rights box in the item layout. 

## Browse buttons

Item pages can have browsing buttons linking to previous/next item page. 
This option is turned off or on in _data/theme.yml:

```
# Item page 
browse-buttons: true 
```

Generating browse buttons adds some time to builds, so can be turned off to save time during development, or if browse doesn't make sense for the collection content.
The item order follows the order in the metadata CSV, so pre-sort the CSV to the desired order.
The logic for calculating the previous/next item requires CollectionBuilder's modified version of page_gen which provides an index_number to the page object that can be used by Liquid.
