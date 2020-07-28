# Building your collection

When developing the collection use `jekyll s` to start the development server.
By default the Jekyll environment is "development". 
In this environment CollectionBuilder skips some template elements to cut down on build time, including these `_includes`:

- item-meta
- page-meta
- google-analytics

Jekyll will also be replacing all `relative_url` and `absolute_url` Liquid filters with the local host url so that the collection will function on the development server, e.g. the links will look like `http://127.0.0.1:4000/demo/psychiana/`.

Jekyll outputs the site files to the `_site` directory.
Ruby provides a development server from that location.

To deploy the collection, you will need to use the Jekyll environment variable "production" and the `build` command rather than serve. 
This is set by adding the env, `JEKYLL_ENV=production`, in front of the command: 
`JEKYLL_ENV=production jekyll build`

To simplify, this command is added in a [Rake](https://github.com/ruby/rake) task in this repository.
Typing the command `rake deploy` will set the correct environment and build. 
(*note:* setting ENV cannot be done on windows CMD, use the rake task or Git Bash terminal).

Jekyll will output the site files to the `_site` directory. 
Everything in `_site` should be copied over to your web server into the correct file location depending on what you set in _config.yml as the baseurl.

*Note:* Since the extra elements are included during "production", the build time will be *significantly* higher than when using the development server.
During production build, Jekyll will generate `relative_url` and `absolute_url` using the `url` and `baseurl` values set in _config.yml. 
For example, the Liquid `{{ '/browse.html' | absolute_url }}` will be output as `http://127.0.0.1:4000/demo/psychiana/browse.html` during development and `https://www.lib.uidaho.edu/demo/psychiana/browse.html` on build.
Keep in mind that because CollectionBuilder makes use of `absolute_url` for many assets and links, the site built using `rake deploy` will only work correctly if it is copied to the correct location on your web server.
It will not work in the `_site` folder, since the links point to locations on your server.
