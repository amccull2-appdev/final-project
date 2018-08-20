class HoldingsController < ApplicationController
  def index
    @holdings = Holding.all

    render("holding_templates/index.html.erb")
  end

  def show
    @holding = Holding.find(params.fetch("id_to_display"))

    render("holding_templates/show.html.erb")
  end

  def new_form
    render("holding_templates/new_form.html.erb")
  end

  def create_row
    @holding = Holding.new

    @holding.user_id = params.fetch("user_id")
    @holding.fund_id = params.fetch("fund_id")

    if @holding.valid?
      @holding.save

      redirect_to("/holdings", :notice => "Holding created successfully.")
    else
      render("holding_templates/new_form.html.erb")
    end
  end

  def edit_form
    @holding = Holding.find(params.fetch("prefill_with_id"))

    render("holding_templates/edit_form.html.erb")
  end

  def update_row
    @holding = Holding.find(params.fetch("id_to_modify"))

    @holding.user_id = params.fetch("user_id")
    @holding.fund_id = params.fetch("fund_id")

    if @holding.valid?
      @holding.save

      redirect_to("/holdings/#{@holding.id}", :notice => "Holding updated successfully.")
    else
      render("holding_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @holding = Holding.find(params.fetch("id_to_remove"))

    @holding.destroy

    redirect_to("/holdings", :notice => "Holding deleted successfully.")
  end
end
