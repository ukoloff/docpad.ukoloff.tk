# DocPad Configuration File
# http://docpad.org/docs/config

#@poweredByDocPad = false

@templateData =
  site:
    title: "My Website"

  getPreparedTitle: ->
    if @document.title
      "#{@document.title} | #{@site.title}"
    else
      @site.title

@collections =
  pages: ->
    @getCollection "html"
    .findAllLive isPage:true
    .on "add", (model) ->
      model.setMetaDefaults layout:"default"

@plugins =
  less:
    parseOptions:
      paths: "#{__dirname}/node_modules"
  copy:
    raw:
      src: 'raw'
    fonts:
      src: '../node_modules/font-awesome/fonts'
      out: 'fonts'
    katex:
      src: "../node_modules/katex-all/dist/fonts"
      out: 'fonts'
  webpack:
    entry:
      the: './the'
