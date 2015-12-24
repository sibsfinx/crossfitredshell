class CoachesController < InheritedResources::Base

  def index
    coaches = Coach.active
    render locals: {collection: coaches}
  end

  def show
    item = Coach.friendly.find(params[:id])
    render locals: {item: item}
  end

  private

    def coach_params
      params.require(:coach).permit(:title, :slug, :content, :active)
    end
end

