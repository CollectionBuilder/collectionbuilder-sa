---
title: About
layout: about
permalink: /about.html
# Edit the markdown on in this file to describe your collection
# Look in _includes/feature for options to easily add features to the page
---

{% include feature/jumbotron.html %} 

{% include feature/nav-menu.html sections="About CollectionBuilder SA;About the About Page" %}

## About CollectionBuilder SA

This demo collection features items from the University of Idaho Library's [Digital Collections](https://www.lib.uidaho.edu/digital/), and is build using [CollectionBuilder-SA](https://github.com/CollectionBuilder/collectionbuilder-sa).

CollectionBuilder-SA is a "Stand Alone" template for creating digital collection and exhibit websites using Jekyll, given:

- a CSV of collection metadata
- a folder of images, PDFs, audio, or video files

Driven by your collection metadata, the template generates engaging visualizations to browse and explore your objects.
The resulting static site can be hosted on any basic web server.

[CollectionBuilder](https://github.com/CollectionBuilder/) is an set of open source tools for creating digital collection and exhibit websites that are driven by metadata and powered by modern static web technology.
See [Getting Started Docs](https://collectionbuilder.github.io/docs/introduction.html) for detailed information.


{% include feature/item-figure.html objectid="demo_001" width="75" %} 


## About the About Page

We want to make About pages exciting, and easy to build. 

The CollectionBuilder about page features a narrowed column with its own (optional) menu, featured content, and some technical information. 

To build one, a user writes in [Markdown](https://guides.github.com/features/mastering-markdown/) and includes  content from the site, as well as typical [Bootstrap](https://getbootstrap.com/) features like cards and modals, using code snippets like those detailed below. 

(Each included file has several options, which are documented in the files themselves. I've given the content widths of 25% and 50% to save space, but you can feature the entire image or document.) 

- Image --> `{% raw %}{% include feature/item-figure.html objectid="demo001" width="25" %}{% endraw %}`

{% include feature/item-figure.html objectid="demo001" width="25" %}

- PDF -- > `{% raw %}{% include feature/item-pdf-embed.html objectid="demo002"  width="25" %}{% endraw %}`

{% include feature/item-pdf-embed.html objectid="demo002" width="25" %}

- Video: `{% raw %}{% include feature/item-video-embed.html objectid="demo004" %}{% endraw %}`

{% include feature/item-video-embed.html objectid="demo004" %}

- Card -- > `{% raw %}{% include feature/card.html header="This is a Card" text="The card features an image from the collection as a cap" objectid="demo004" width="25" centered=true %}{% endraw %}`

{% include feature/card.html header="This is a Card" text="The card features an image from the collection as a cap" objectid="demo004" width="25" centered=true %}

- Buttons -- > `{% raw %}{% include feature/button.html text="Button Link to Somewhere" link="https://collectionbuilder.github.io/" color="success" %}{% endraw %}`

{% include feature/button.html text="Button Link to Somewhere" link="https://collectionbuilder.github.io/" color="success" centered=true %}
  
- Alerts -- > `{% raw %}{% include feature/alert.html text="this is an *alert* that 'warns' a user" color="warning" align="center" %}{% endraw %}`

{% include feature/alert.html text="This is an *alert* that 'warns' a user with centrally aligned text." color="warning" align="center"  %}

- Modals -- > `{% raw %}{% include feature/modal.html button="This is a modal using a 'primary' colored button to invite clicking" title="when clicked:" text="A Modal will pop out a box with some more information" color="primary"  %}{% endraw %}`

{% include feature/modal.html button="This is a modal using a 'primary' colored button to invite clicking" title="When clicked:" text="A Modal will pop out a box with some more information" color="primary"  %}

We hope this makes it easier for site builders to develop the collection AND add interesting and engaging contextual information.  
