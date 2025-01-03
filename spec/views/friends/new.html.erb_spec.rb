# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'friends/new', type: :view do
  before(:each) do
    assign(:friend, Friend.new)
  end

  it 'renders new friend form' do
    render

    expect(rendered).to include('New friend')
    expect(rendered).to include('Back')
  end
end
