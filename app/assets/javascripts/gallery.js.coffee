window.Gallery ||= {}

((app) ->

  app.options =
    history: false
    focus: false
    escKey: true
    showAnimationDuration: 0
    hideAnimationDuration: 0
    tapToToggleControls: true
  $(document).ready ->
    $pswpElement = $('.pswp')[0]
    $pswpCollection = $('@pswp-collection')
    $pswpCollection.each ->
      collection = $(@)
      $pswpLinks = collection.find('[role*="pswp-link"]')
      $pswpLinks.on 'click', (e) ->
        e.preventDefault()
        items = _.map $pswpLinks, getItem
        index = $(@).data('index') || 0
        gallery = new PhotoSwipe $pswpElement, PhotoSwipeUI_Default, items, app.options
        app.openPhotoSwipe $pswpElement, items, index
        gallery.listen 'gettingData', (index, item) ->
          if item.w < 1 or item.h < 1
            img = new Image
            img.onload = ->
              item.w = @width
              item.h = @height
              gallery.invalidateCurrItems()
              gallery.updateSize true
              return
            img.src = item.src
          return
        gallery.init()

  getItem = (link) ->
    src = $(link).attr 'href'
    w = 0
    h = 0
    {
      src: src
      w: w
      h: h
    }

  app.openPhotoSwipe = ($pswpElement, items, index) ->
    return

)(window.Gallery ||= {})
