class AnswersController < ApplicationController
  before_action :set_answer

  # GET /answers
  # GET /answers.json
  def index
    @answers = @question.answers.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = @question.answers.build
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = @question.answers.build(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to [@section, @question], notice: 'Answer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @answer }
      else
        format.html { render action: 'new' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to [@section, @question], notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to [@section, @question] }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @section = Section.find(params[:section_id]) if params[:section_id].present?
      @question = Question.find(params[:question_id]) if params[:question_id].present?
      @answer = Answer.find(params[:id]) if params[:id].present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:text)
    end
end
