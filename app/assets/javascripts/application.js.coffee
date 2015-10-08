#= require jquery/dist/jquery
#= require FitText.js/jquery.fittext
#= require jquery.role/lib/jquery.role
# require webfontloader/webfontloader
# require font_loader
# require modernizr/modernizr

$ ->
  $('@fit-text').fitText()
  $('@fit-text-limited').fitText
    minFontSize: ($(@).data('min-font-size') || 0) + 'px'
    maxFontSize: ($(@).data('max-font-size') || 200) + 'px'


