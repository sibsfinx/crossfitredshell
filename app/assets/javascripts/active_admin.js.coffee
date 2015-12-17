#= require active_admin/base
#= require jquery.role/lib/jquery.role
#= require tinymce-jquery
#= require select2/select2
#= require select2/select2_locale_ru
#= require autosize/dest/autosize


window.jQuery.fn.autosize = ->
  return autosize(@)

$ ->
  #$('[role*=admin-content-editor]').wysihtml5()
  tinyMCE.init
    selector: '[role*=admin-content-editor]'

  $('@select2').select2
    width: 'resolve'

  $('@select2-autowidth').select2()

  $('@select2-tags').select2
    tags: true
    tokenSeparators: [',']

  $('@autosize').autosize()


