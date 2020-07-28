# CollectionBuilder-SA 

CollectionBuilder-SA ("Stand Alone") is a template for creating digital collection and exhibit websites using Jekyll, given:

- a CSV of collection metadata
- a folder of images, PDFs, audio, or video files

Driven by your collection metadata, the template generates engaging visualizations to browse and explore your objects.
The resulting static site can be hosted on any basic web server.

CollectionBuilder-SA requires that you generate a thumb and small image derivative/representation for each object in your collection, in additional to the full sized object.
This can be automated using the [included rake tasks](https://github.com/CollectionBuilder/collectionbuilder-sa/blob/master/docs/rake-tasks.md) or manually created using other software.

*Note:* CollectionBuilder-SA collections are scalable to thousands of items, with the only limitation being the final file size of the Lunr static search index.
The search page for collections with extensive text metadata and thousands of items will load slowly.
Full document text search is possible, but not generally suggested.

[CollectionBuilder](https://github.com/CollectionBuilder/) is an set of open source tools for creating digital collection and exhibit websites that are driven by metadata and powered by modern static web technology.
See [Getting Started Docs](https://collectionbuilder.github.io/docs/introduction.html) for detailed information.

If you are interested in using CollectionBuilder, or are already using it, please drop us a line (**libstatic.uidaho@gmail.com**) since we would love to learn more about its use in the wild. 
There are also currently opportunities to [collaborate on CollectionBuilder](https://collectionbuilder.github.io/about.html#the-grant).

----------

CollectionBuilder is a project of University of Idaho Library's [Digital Initiatives](https://www.lib.uidaho.edu/digital/) and the [Center for Digital Inquiry and Learning](https://cdil.lib.uidaho.edu) (CDIL) as part of the Lib-STATIC toolkit. 
Powered by the open source static site generator [Jekyll](https://jekyllrb.com/) and a modern static web stack, it puts collection metadata to work building beautiful sites.

The basic frame work is created using [Bootstrap](https://getbootstrap.com/) and [jQuery](https://jquery.com/).
Metadata visualizations are built using open source libraries such as [DataTables](https://datatables.net/), [Leafletjs](http://leafletjs.com/), [lightGallery](http://sachinchoolur.github.io/lightGallery/), [FontAwesome](https://fontawesome.com/), [lazysizes](https://github.com/aFarkas/lazysizes), and [Lunr.js](https://lunrjs.com/).
Object metadata is exposed using [Schema.org](http://schema.org) and [Open Graph protocol](http://ogp.me/) standards.

Questions can be directed to **libstatic.uidaho@gmail.com**

## License

CollectionBuilder documentation and general web content is licensed [Creative Commons Attribution-ShareAlike 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/). 
This license does *NOT* include any objects or images used in digital collections, which may have individually applied licenses described by a "rights" field.
CollectionBuilder code is licensed [MIT](https://github.com/CollectionBuilder/collectionbuilder-contentdm/blob/master/LICENSE). 
This license does not include external dependencies included in the `assets/lib` directory, which are covered by their individual licenses.
