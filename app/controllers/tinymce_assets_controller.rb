class TinymceAssetsController < ApplicationController
  def create
    # Take upload from params[:file] and store it somehow...
    # Optionally also accept params[:hint] and consume if needed
    #
    # The plugin will relay option uploadimage_hint in the call to .tinymce() to the POSTed URL as param hint.
    # You may use this to relay any hints you wish (for example, blog post ID #) to the controller.

    render json: {
      image: {
        url: view_context.image_url(image)
      }
    }, content_type: "text/html"
  end
end
