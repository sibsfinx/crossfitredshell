#= require active_admin/base
#= require jquery.role/lib/jquery.role
#= require tinymce-jquery

$ ->
  #$('[role*=admin-content-editor]').wysihtml5()
  tinyMCE.init
    selector: '[role*=admin-content-editor]'
