class CandidatesController < ApplicationController

  # GET /positions/1/candidates
  def index
    # For URL like /positions/1/candidates
    # Get the position with id=1
    @position = Position.find(params[:position_id])
    # Access all candidates for that position
    @candidates = @position.candidates
  end

  # GET /positions/1/candidates/2
  def show
    @position = Position.find(params[:position_id])
    # For URL like /positions/1/candidates/2
    # Find an candidate in positions 1 that has id=2
    @candidate = @position.candidates.find(params[:id])
  end

  # GET /positions/1/candidates/new
  def new
    @position = Position.find(params[:position_id])
    # Associate an candidate object with position 1
    @candidate = @position.candidates.build
  end

  # POST /positions/1/candidates
  def create
    @position = Position.find(params[:position_id])
    # For URL like /positions/1/candidates
    # Populate an candidate associate with position 1 with form data
    # Position will be associated with the candidate
    # @candidate = @position.candidates.build(params.require(:candidate).permit!)
    @candidate = @position.candidates.build(params.require(:candidate).permit(:name, :cv_rating, :availability, :interview_stage, :phone_number, :email))
    if @candidate.save
      # Save the candidate successfully
      redirect_to position_candidate_url(@position, @candidate)
    else
      render :action => "new"
    end
  end

  # GET /positions/1/candidates/2/edit
  def edit
    @position = Position.find(params[:position_id])
    # For URL like /positions/1/candidates/2/edit
    # Get candidate id=2 for position 1
    @candidate = @position.candidates.find(params[:id])
  end

  # PUT /positions/1/candidates/2
  def update
    @position = Position.find(params[:position_id])
    @candidate = Candidate.find(params[:id])

    if @candidate.update(params.require(:candidate).permit(:name, :cv_rating, :availability, :interview_stage, :phone_number, :email))
      # Save the candidate successfully
      redirect_to position_candidate_url(@position, @candidate)
    else
      render :action => "edit"
    end
  end

  # DELETE /positions/1/candidates/2
  def destroy
    @position = Position.find(params[:position_id])
    @candidate = Candidate.find(params[:id])
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to position_candidates_path(@position) }
      format.xml { head :ok }
    end
  end

end
