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
        console.log items
        app.openPhotoSwipe items

    getItem = (link) ->
      src = $(link).attr 'href'
      img = new Image
      img.src = src
      w = img.naturalWidth
      h = img.naturalHeight
      {
        src: src
        w: w
        h: h
      }

    app.openPhotoSwipe = (items) ->
      options =
        history: false
        focus: false
        escKey: true
        showAnimationDuration: 200
        hideAnimationDuration: 200
        tapToToggleControls: true
      gallery = new PhotoSwipe($pswpElement, PhotoSwipeUI_Default, items, options)
      gallery.init()
      return

)(window.Gallery ||= {})
