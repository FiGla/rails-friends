# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'friends/index', type: :view do
  let(:user) { User.create(email: 'example@example.com', password: '123456') }
  before(:each) do
    assign(:friends, [
             Friend.create!(first_name: 'hello', last_name: 'world', user_id: user.id),
             Friend.create!(first_name: 'abc', last_name: 'dfg', user_id: user.id)
           ])
  end

  it 'renders a list of friends' do
    render

    expect(rendered).to include('Name')
    expect(rendered).to include('Add new friend')

    expect(rendered).to include('hello')
    expect(rendered).to include('abc')
  end
end
