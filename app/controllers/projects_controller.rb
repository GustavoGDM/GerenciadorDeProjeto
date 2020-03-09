class ProjectsController < ApplicationController
  layout "application"
  before_action :authenticate_user!
  before_action :set_project, only: [:show ,:edit, :update, :destroy]
  before_action :set_issues, only: [:show]
  def index
    @msg = nil;
    @projects = Project.where( user_id:current_user.id).order(:name)
    if !params[:search].nil?
      @search_term = params[:search]
      @projects = @projects.where('lower(name) LIKE ?', "%#{@search_term.downcase}%")
      if @projects.blank?
        @msg = "🙃 Ops Não foi encontrado nada"
      end
    end
  end
  
  def new ()
    @project = Project.new
  end
  
  def show
    @msg = nil;
    if !params[:search].nil?
      @search_term = params[:search]
      @issues = @issues.where('lower(name) LIKE ?', "%#{@search_term.downcase}%")
    end
  end

  def edit
  end

  def create
    @project = Project.new(projects_params)
    @project.user_id = current_user.id
    respond_to do |format|
      if @project.save
        format.html {redirect_to @project, notice: 'Projeto Criado com sucesso'}
      else
        format.html { render :new }
      end
    end
  end
  def update
    respond_to do |format|
      if @project.update(projects_params)
        format.html {redirect_to @project, notice: 'Projeto Alterado com sucesso'}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_path, notice: 'Projeto deletado com sucesso' }
    end
  end
  
  private
    def set_project
      @project = Project.find(params[:id])
    end
    
    def set_issues
      if @issues = Issue.where(project_id: @project.id)
        @issues
      end
    end
  
    def projects_params
      params.require(:project).permit(:name,:status,:description, :start_date, :delivery_estimate, :delivered_date,:budgeted,:cost_done)
    end
end
