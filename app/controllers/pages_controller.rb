class PagesController < ApplicationController
  def home
    render inertia: 'Home', props: {
      name: 'Ibo'
    }
  end
end