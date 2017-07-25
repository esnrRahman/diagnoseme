require 'rails_helper'

RSpec.describe 'routes for patients', :type => :routing do
  it 'routes /patients to the patients controller' do
    expect(get("/patients")).to route_to(:controller => "patients", :action => "index")
  end

end