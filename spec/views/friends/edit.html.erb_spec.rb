# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'friends/edit', type: :view do
  let(:friend) do
    Friend.create!
  end

  before(:each) do
    assign(:friend, friend)
  end

  it 'renders the edit friend form' do
    render

    assert_select 'form[action=?][method=?]', friend_path(friend), 'post' do
    end
  end
end
