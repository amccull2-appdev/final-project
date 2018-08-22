class SimilaritiesController < ApplicationController
  def index
    @similarities = Similarity.all

    render("similarity_templates/index.html.erb")
  end

  def show
    @similarity = Similarity.find(params.fetch("id_to_display"))

    render("similarity_templates/show.html.erb")
  end

  def new_form
    render("similarity_templates/new_form.html.erb")
  end

  def create_row
    @similarity = Similarity.new

    @similarity.primary_fund = params.fetch("primary_fund")
    @similarity.foreign_fund = params.fetch("foreign_fund")
    @similarity.ranking = params.fetch("ranking")

    if @similarity.valid?
      @similarity.save

      redirect_to("/similarities", :notice => "Similarity created successfully.")
    else
      render("similarity_templates/new_form.html.erb")
    end
  end

  def edit_form
    @similarity = Similarity.find(params.fetch("prefill_with_id"))

    render("similarity_templates/edit_form.html.erb")
  end

  def update_row
    @similarity = Similarity.find(params.fetch("id_to_modify"))

    @similarity.primary_fund = params.fetch("primary_fund")
    @similarity.foreign_fund = params.fetch("foreign_fund")
    @similarity.ranking = params.fetch("ranking")

    if @similarity.valid?
      @similarity.save

      redirect_to("/similarities/#{@similarity.id}", :notice => "Similarity updated successfully.")
    else
      render("similarity_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @similarity = Similarity.find(params.fetch("id_to_remove"))

    @similarity.destroy

    redirect_to("/similarities", :notice => "Similarity deleted successfully.")
  end
end
