class DocumentsController < ApplicationController
  # Ensure user is authenticated before any action
  before_action :authenticate_user!
  # Load and authorize resources using CanCanCan
  load_and_authorize_resource

  # GET /documents
  def index
    @documents = Document.all
  end

  # GET /documents/1
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  def create
    @document = Document.new(document_params)
    @document.user = current_user # Associate document with the current user

    if @document.save
      redirect_to @document, notice: "Document was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /documents/1
  def update
    if @document.update(document_params)
      redirect_to @document, notice: "Document was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /documents/1
  def destroy
    @document.destroy
    redirect_to documents_url, notice: "Document was successfully destroyed."
  end

  private

  # Only allow a list of trusted parameters through
  def document_params
    params.require(:document).permit(:title, :description, :file)
  end
end