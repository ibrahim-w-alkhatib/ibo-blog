class PagesController < ApplicationController
  def about
    render inertia: "About"
  end
end
