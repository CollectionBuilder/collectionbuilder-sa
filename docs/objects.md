# Collection Objects for CollectionBuilder-SA

CollectionBuilder-SA is designed for large, stand alone collections self-hosted on any basic static web server or platform.
The approach is similar to CollectionBuilder-GH, but is more robust and goes beyond the limitations of hosting on GitHub Pages.

CB-SA requires that you generate a thumb and small image derivative or representation for each object in your collection (for all item formats), in additional to providing the full sized object for download.
This can be automated using the included [Rake tasks](rake-tasks.md) or manually created using other software.

It is important to note that collection object files will **not** be committed into your project (thus not stored on GitHub). 
Once your objects are prepared you will deploy them to the web along side your static site or on an external platform.

## Object Guidelines for SA

- **Supported formats:** tif, jpg, png, pdf, mp3, mp4 -- plus YouTube, but you won't have objects for those!
- **File size:** the full size object can be any size you think your users might want to download. This might not be your full sized preservation file--generally, we try to provide very high quality objects to users, but balance that against the practicality of huge file sizes--most users don't want a 1GB TIF or PDF!
- **Filenaming:** to avoid issues, please pay close attention to filenaming conventions! You will use the **exact filenames** (including extension and same case) to populate the "filename" field of your collection metadata. For ease of use, the base filename (i.e. with out extension) should match the "objectid" used in the metadata. The filename should be:
    - all lowercase
    - no spaces
    - no special characters (underscores (`_`) are okay.

## Creating Small and Thumb Derivatives

Gather your collection's full sized digital objects in one folder and get them organized. Then, head over to our [Object Derivatives](object-derivatives.md) page to follow step-by-step instructions for creating derivatives using CB-SA's built in "generate_derivatives" Rake task.

## Object Deployment

When using CB-SA the digital object files will not be stored on GitHub (i.e. don't commit your objects! Git is not optimized for binary file storage and GitHub has size limits).
Instead, the object files can be deployed in any web accessible location--in the "objects" folder with the generated website code, or anywhere else that you care to implement!

This gives you a lot of flexibility to deploy and manage your objects depending on your needs.

For example, here are some options for object file locations depending on your setup and stage of development:

- **Just Testing:** keep the collection files in the "objects" folder in the project repository on your local machine. The files will *not* be committed to the repository, so are not available on GitHub. However, you will still be able to generate and test the site on your local machine.
- **Objects Deployed with Site:** you keep the collection files in the "objects" folder in the project repository on your local machine. When generating the site for deployment, Jekyll will copy the objects into the "_site" folder along with the rest of the site assets. Everything in "_site" is copied to a static web server (via SFTP or file share method) for your live deployment.
- **Objects in External Location:** prep your collection files, then move the objects to a static file hosting service (often provided by universities or purchased via a platform such as Digital Ocean or Reclaim Host). The objects are available at that location, e.g. "https://www.example.com/objects/newproject/". For the collection website, you can deploy the site assets in a totally separate location with out any objects, e.g. you set up a GitHub Action to build the CB-SA project resulting in the website hosted at "https://exampleuser.github.io/newproject/". This has advantage of being able to manage objects and html separately on platforms optimized for delivering each.

## Prepare Objects Directory 

The location of the "objects" directory is set in "_config.yml" so that the web pages will know where to look, using the `objects:` key.

- If using local folder, use the directory name with proceeding slash. e.g. `objects: /objects`
- If using external web location, provide full URL to the folder, e.g. `objects: https://example.com/collection/objects`

Once you have prepped your objects and decided where to deploy them, you will also need to add their location to their "filename" metadata field.
This is generally done by starting from a "filename" column in the metadata listing the full filename for each record.
From the "filename" column use formulas in Sheets or OpenRefine to create URLs pointing to the files. 
