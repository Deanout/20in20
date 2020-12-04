class SnippetsController < ApplicationController
  before_action :set_snippet, only: %i[show edit update destroy]

  # GET /snippets
  # GET /snippets.json
  def index
    set_snippets
  end

  # GET /snippets/1
  # GET /snippets/1.json
  def show; end

  # GET /snippets/new
  def new
    @snippet = Snippet.new
  end

  # GET /snippets/1/edit
  def edit; end

  # POST /snippets
  # POST /snippets.json
  def create
    @snippet = Snippet.new(snippet_params)

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to @snippet, notice: 'Snippet was successfully created.' }
        format.json { render :show, status: :created, location: @snippet }
      else
        format.html { render :new }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snippets/1
  # PATCH/PUT /snippets/1.json
  def update
    respond_to do |format|
      if @snippet.update(snippet_params)
        format.html { redirect_to @snippet, notice: 'Snippet was successfully updated.' }
        format.json { render :show, status: :ok, location: @snippet }
      else
        format.html { render :edit }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  # DELETE /snippets/1.json
  def destroy
    @snippet.destroy
    respond_to do |format|
      format.html { redirect_to snippets_url, notice: 'Snippet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_snippets
    tag_name = params[:tag]
    lang_name = params[:lang]
    filter_by_name(tag_name, lang_name)
  end

  def filter_by_name(tag_name, lang_name)
    if !tag_name.nil?
      # do this if tag name is not nil.
      # So we're filtering by tag name.
      tag = Tag.find_by_name(tag_name)
      @snippets = tag.nil? ? Snippet.all : tag.snippets
    elsif !lang_name.nil?
      # Filter by the lang name.
      lang = Language.find_by_name(lang_name)
      @snippets = lang.nil? ? Snippet.all : lang.snippets
    else
      @snippets = Snippet.all
    end
    @snippets
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_snippet
    @snippet = Snippet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def snippet_params
    params.require(:snippet).permit(:title, :body, :all_tags, :language_id)
  end
end
