class SectionsController < InheritedResources::Base

  def index
    sections = Section.active
    render locals: {collection: sections}
  end

  def show
    item = Section.friendly.find(params[:id])
    render locals: {item: item}
  end

  private

    def section_params
      params.require(:section).permit(:title, :slug, :content, :active)
    end
end

