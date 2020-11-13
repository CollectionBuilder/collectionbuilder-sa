# Metadata Standards for CB Stand Alone

See general documentation: https://collectionbuilder.github.io/docs/metadata.html

## Required fields

- `objectid`: unique string, all lowercase with no spaces or special characters as it will used to form the item’s URL. Underscores (_) and dashes (-) are okay; slashes (/) should NOT be used in this field. Objects without an objectid will not be displayed in the collection. Objects with non-unique objectid will be overwritten.
- `title`: string description of object, used through out the template in representations of the object. A title is not technically required, but will leave blanks areas in the template.

## Object Download and Display images

- `object_download`: a full URL to download the digital object or relative path if items are contained with in the project.
- `image_small`: a full URL to a small image representation of the object or relative path if items are contained with in the project.
- `image_thumb`: a full URL to a thumb image representation of the object or relative path if items are contained with in the project.
- `format`: object's MIME media type. If an object does not have an image_small or image_thumb, format is used by template logic to switch between different icons.

Each object will likely have an object_download value, the link where the digital file can be downloaded (or potentially accessed in a different platform). 
It is not a required field--items without an object_download will become metadata only records.

For display images in various visualizations the template checks the fields image_small and image_thumb for links to image derivatives.
If image derivatives are not available (i.e. the field is left blank), the logic will select icons or alternatives based on the format field.

These fields should be filed out in your spreadsheet using formulas / recipes depending on where your objects are hosted. 
This provides flexibility to include objects from multiple sources and to generate the URLs using a variety of approaches without needing to modify the template code.

If the objects are included within the project repository use a relative path. 
The relative path will be converted into a full URL during build.
For example if some images are in the "objects" folder, use a relative path, e.g. `/objects/example_object.jpg`.

## Object Template

- `object_template`: a template type used in logic to set up different Item page features. If blank the object will default to a generic item page. Default supported options: `image`,`pdf`, `video`, `audio`, `youtube-embed`. See below for details.

### image template 

Displays image_small if available, with fall back to object_download. 
Adds LightGallery view to open images full screen using object_download, with fall back to image_small.

### pdf template

Displays image_small if available, with fall back to image_thumb, or a pdf icon.

### video template

Uses `<video>` element to embed video file from object_download as src.

### audio template

Uses `<audio>` element to embed audio file from object_download as src. 

### youtube-embed template

For items that are YouTube videos, please fill in the object_download field with the YouTube share link `https://youtu.be/dbKNr3wuiuQ` or watch link `https://www.youtube.com/watch?v=dbKNr3wuiuQ`.
Please ensure the youtubeid is the end of URL (e.g. `dbKNr3wuiuQ`, and does *not* end with other query strings such as `?t=51` or `&feature=youtu.be`). 

The template will parse the object_download link to find the youtubeid and set up a iframe embed using the modest branding and privacy options. 

### compound-image template

Looks for multiple image src separated by `;` in image_small and object_download.
Displays all images listed in the fields.
