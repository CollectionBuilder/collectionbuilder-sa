# Item pages

CollectionBuilder-SA uses "CollectionBuilder Page Generator" plugin to generate individual pages for each record in the collection metadata on the fly.

Typical use requires no configuration.
CB Page Gen will automatically generate pages from the data specified by _config.yml `metadata` (the same as used to populate the rest of the site).
For more advanced configuration options, including generating other types of pages, see docs/plugins.md.

CB Page Gen passes all metadata fields through to Jekyll as if each was front matter on a normal file so that the values can be used to populate Item page content.
This page object is passed to the layout matching the `object_template` value, falling back to the default `template` value (normally `item`).

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
