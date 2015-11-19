#= require jquery
#= require jquery_ujs
#= require jquery/dist/jquery
#= require lodash
#= require FitText.js/jquery.fittext
#= require jquery.role/lib/jquery.role
#= require photoswipe/dist/photoswipe
#= require photoswipe/dist/photoswipe-ui-default
#= require lead_form

# require webfontloader/webfontloader
# require font_loader
# require modernizr/modernizr

$ ->
  $('@fit-text').fitText()
  $('@fit-text-limited').fitText
    minFontSize: ($(@).data('min-font-size') || 0) + 'px'
    maxFontSize: ($(@).data('max-font-size') || 200) + 'px'

  $('@scroll-link').on 'click', (e) ->
    e.preventDefault()
    target = $(@).data('target')
    if target?.length > 0
      top = $(target).offset().top
      $('body').animate({
        scrollTop: top
      }, (300/1600*top))



