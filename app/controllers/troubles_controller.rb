class TroublesController < ApplicationController
before_filter :authenticate_user!
http_basic_authenticate_with name: "cano19781", password: "caracas1", except: [:index, :show]

   
  # GET /troubles
  # GET /troubles.json
def abierto
  @troubles = Trouble.order.paginate(:per_page => 8, :page => params[:page]).where(:state=>"Abierto")
  @numero = Trouble.where(:state=>"Abierto").count
end

def cerrado
  @troubles = Trouble.order.paginate(:per_page => 8, :page => params[:page]).where(:state=>"Cerrado")
  @numero = Trouble.where(:state=>"Cerrado").count
end

  def index
    @troubles = Trouble.all
    @troubles = Trouble.order.paginate(:per_page => 5, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @troubles }
    end
  end

  # GET /troubles/1
  # GET /troubles/1.json
  def show
    @trouble = Trouble.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trouble }
    end
  end

  # GET /troubles/new
  # GET /troubles/new.json
  def new
    @trouble = Trouble.new
    @users = User.all.map {|user| [user.name, user.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trouble }
    end
  end

  # GET /troubles/1/edit
  def edit
    @trouble = Trouble.find(params[:id])
    @users = User.all.map {|user| [user.name, user.id]}
  end

  # POST /troubles
  # POST /troubles.json
  def create
    @trouble = Trouble.new(trouble_params)

    respond_to do |format|
      if @trouble.save
        format.html { redirect_to @trouble, notice: 'El ticket ha sido creado correctamente.' }
        format.json { render json: @trouble, status: :created, location: @trouble }
      else
        format.html { render action: "new" }
        format.json { render json: @trouble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /troubles/1
  # PATCH/PUT /troubles/1.json
  def update
    @trouble = Trouble.find(params[:id])

    respond_to do |format|
      if @trouble.update_attributes(trouble_params)
        format.html { redirect_to @trouble, notice: 'El ticket ha sido actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trouble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /troubles/1
  # DELETE /troubles/1.json
  def destroy
    @trouble = Trouble.find(params[:id])
    @trouble.destroy

    respond_to do |format|
      format.html { redirect_to troubles_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def trouble_params
      params.require(:trouble).permit(:category, :client_id, :severity, :state, :text, :title, :user_id, :image)
    end
end
