window.Gallery ||= {}

((app) ->
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
        app.openPhotoSwipe $pswpElement, items, index

  getItem = (link) ->
    src = $(link).attr 'href'
    img = new Image
    img.src = src
    w = img.naturalWidth
    h = img.naturalHeight
    #img = null
    {
      src: src
      w: w
      h: h
    }

  app.openPhotoSwipe = ($pswpElement, items, index) ->
    options =
      history: false
      focus: false
      escKey: true
      showAnimationDuration: 0
      hideAnimationDuration: 0
      tapToToggleControls: true
    gallery = new PhotoSwipe($pswpElement, PhotoSwipeUI_Default, items, options)
    gallery.init()
    return

)(window.Gallery ||= {})
