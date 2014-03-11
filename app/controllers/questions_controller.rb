class QuestionsController < ApplicationController
  before_action :set_question

  # GET /questions
  # GET /questions.json
  def index
    @questions = @section.questions.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = @section.questions.build
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = @section.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to [@section, @question], notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to [@section, @question], notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to @section }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @section = Section.find(params[:section_id]) if params[:section_id].present?
      @question = Question.find(params[:id]) if params[:id].present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text)
    end
end
