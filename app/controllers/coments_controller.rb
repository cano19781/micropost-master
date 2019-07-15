class ComentsController < ApplicationController
	http_basic_authenticate_with name: "cano19781", password: "caracas1", only: :destroy
	def create
    @trouble = Trouble.find(params[:trouble_id])
    @coment = @trouble.coments.create(coment_params)
    redirect_to trouble_path(@trouble)
  end

   def destroy
    @trouble = Trouble.find(params[:trouble_id])
    @coment = @trouble.coments.find(params[:id])
    @coment.destroy
    redirect_to trouble_path(@trouble)
  end
 
  private
    def coment_params
      params.require(:coment).permit(:commenter, :body)
    end



end


