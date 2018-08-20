class EtfsController < ApplicationController
  def index
    @etfs = Etf.all

    render("etf_templates/index.html.erb")
  end

  def show
    @etf = Etf.find(params.fetch("id_to_display"))

    render("etf_templates/show.html.erb")
  end

  def new_form
    render("etf_templates/new_form.html.erb")
  end

  def create_row
    @etf = Etf.new

    @etf.ticker = params.fetch("ticker")
    @etf.name = params.fetch("name")
    @etf.user_id = params.fetch("user_id")
    @etf.rating = params.fetch("rating")
    @etf.fee = params.fetch("fee")
    @etf.similarity_ranking = params.fetch("similarity_ranking")

    if @etf.valid?
      @etf.save

      redirect_to("/etfs", :notice => "Etf created successfully.")
    else
      render("etf_templates/new_form.html.erb")
    end
  end

  def edit_form
    @etf = Etf.find(params.fetch("prefill_with_id"))

    render("etf_templates/edit_form.html.erb")
  end

  def update_row
    @etf = Etf.find(params.fetch("id_to_modify"))

    @etf.ticker = params.fetch("ticker")
    @etf.name = params.fetch("name")
    @etf.user_id = params.fetch("user_id")
    @etf.rating = params.fetch("rating")
    @etf.fee = params.fetch("fee")
    @etf.similarity_ranking = params.fetch("similarity_ranking")

    if @etf.valid?
      @etf.save

      redirect_to("/etfs/#{@etf.id}", :notice => "Etf updated successfully.")
    else
      render("etf_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @etf = Etf.find(params.fetch("id_to_remove"))

    @etf.destroy

    redirect_to("/etfs", :notice => "Etf deleted successfully.")
  end
end
