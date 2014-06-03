require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do
 context 'viewing all articles' do
  before do
    get :index
  end

  it {should redirect_to(root_path)}

 end

end
