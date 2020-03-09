class IssuesController < ApplicationController
   layout "application"
   before_action :authenticate_user!
   before_action :set_issue, only: [:show,:edit,:update,:destroy]
   before_action :set_project, only: [:new ]
   before_action :set_for_edit , only:[:edit,:update,:destroy]
  
  def new
    @issue = Issue.new
  end
  
  def show
  end
  def edit

  end

  def create
    @issue = Issue.new(issues_params) 
    respond_to do |format|
      if @issue.save
        @project = Project.find(@issue.project_id)
        format.html {redirect_to @project, notice: 'Bug Criado Com sucesso'}
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @issue.update(issues_params)
        format.html {redirect_to @project, notice: 'Projeto Alterado com sucesso'}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Projeto deletado com sucesso' }
    end
  end
  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_issue
      @issue = Issue.find(params[:id])
    end

    def set_for_edit
      @project = Project.find(@issue.project_id)
    end

    def issues_params
      params.require(:issue).permit(:name,:status,:description, :start_date, :done_date,:project_id)
    end
end
