# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'friends/edit', type: :view do
  let(:user) { User.create(email: 'example@example.com', password: '123456') }
  let(:friend) do
    Friend.create!(first_name: 'hello', last_name: 'world', user_id: user.id)
  end

  before(:each) do
    assign(:friend, friend)
  end

  it 'renders the edit friend form' do
    render

    expect(rendered).to include('Editing friend')
    expect(rendered).to include('Back')
  end
end
