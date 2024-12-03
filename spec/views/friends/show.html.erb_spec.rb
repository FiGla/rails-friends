# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'friends/show', type: :view do
  let(:user) { User.create(email: 'example@example.com', password: '123456') }
  before(:each) do
    assign(:friend, Friend.create!(first_name: 'hello', last_name: 'world', user_id: user.id))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to include('hello')
    expect(rendered).to include('Edit')
    expect(rendered).to include('Back')
    expect(rendered).to include('Destroy')
  end
end
