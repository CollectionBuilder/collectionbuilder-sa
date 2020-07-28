# YouTube

Items in a collection that are hosted on YouTube must have a column `youtubeid`.
CollectionBuilder uses logic based on `youtubeid` to use the YouTube API to retrieve images and create video embeds (rather than CONTENTdm).
If a `youtubeid` is present, it will treat the object as a YouTube video.

## Item page

An item page for an object with `youtubeid` will display the video embedded in an [YouTube Player iframe](https://developers.google.com/youtube/iframe_api_reference). 
It is styled using [Bootstrap Embeds utility class](https://getbootstrap.com/docs/4.4/utilities/embed/), set as 16x9 ratio (which is default for YouTube, however, if your videos differ significantly from that ratio try modifying the class in _layouts/item.html).
The embed is given these options:

- Privacy-enhanced mode: does not send data to YouTube unless users click play (enabled by using domain `www.youtube-nocookie.com` rather than `www.youtube.com`
- Related videos: the option `rel=0` asks YouTube to not show related videos. However, YouTube changed this option in 2018 and may still show related videos from the same channel.
- Modest branding: the option `modestbranding=1` removes some YouTube branding from the iframe player. 

## Item images 

To retrieve image representations for other pages in CollectionBuilder, objects with `youtubeid` will use the YouTube image API.
The API is not well documented by Google, but is used by many sites and js libraries.

CollectionBuilder uses these calls, which are built into the image includes:
youtube-large.html, youtube-small.html, and youtube-thumb.html.
These do not use SD or max quality versions since those can not be guaranteed for all videos
(if you know your collection videos are high res, you may want to modify to use those options since all image sizes are relatively small).
However, these includes are rarely used in the current project, since most calls for YouTube images are via JS.

Basically, you can get four sizes of the default thumbnail, or four smaller thumbnails from different points in the video.
You can use the domain "img.youtube.com" or "i3.ytimg.com"

Default images:

- thumb 120x90, https://img.youtube.com/vi/{{ youtubeid }}/default.jpg
- medium quality 320x180, https://img.youtube.com/vi/{{ youtubeid }}/mqdefault.jpg
- high quality 480x360, https://img.youtube.com/vi/{{ youtubeid }}/hqdefault.jpg 
- SD 640x480 (not available for all videos), https://img.youtube.com/vi/{{ youtubeid }}/sddefault.jpg
- max quality 1280×720 (or 1920x1080?, not available for all videos), https://img.youtube.com/vi/{{ youtubeid }}/maxresdefault.jpg 

Auto thumbs:

- default thumb, 480x360, https://img.youtube.com/vi/{{ youtubeid }}/0.jpg 
- alternate 120x90, https://img.youtube.com/vi/{{ page.youtubeid }}/1.jpg 
- alternate 120x90, https://img.youtube.com/vi/{{ page.youtubeid }}/2.jpg 
- alternate 120x90, https://img.youtube.com/vi/{{ page.youtubeid }}/3.jpg

For more control, you can use [YouTube Data API](https://developers.google.com/youtube/v3/), but it requires a key to access.
