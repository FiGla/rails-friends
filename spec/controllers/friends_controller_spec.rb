# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendsController, type: :controller do
  let(:user) { User.create(email: 'example@example.com', password: '123456') }
  let(:valid_attributes) do
    {
      first_name: 'am',
      last_name: 'bm',
      user_id: user.id
    }
  end

  let(:invalid_attributes) do
    {
      first_name: 'am'
    }
  end

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Friend.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      friend = Friend.create! valid_attributes
      get :show, params: { id: friend.id }
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      friend = Friend.create! valid_attributes
      get :edit, params: { id: friend.id }
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Friend' do
        expect do
          post :create, params: { friend: valid_attributes }
        end.to change(Friend, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Friend' do
        expect do
          post :create, params: { friend: invalid_attributes }
        end.to change(Friend, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post :create, params: { friend: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          first_name: 'ami'
        }
      end

      it 'updates the requested friend' do
        friend = Friend.create! valid_attributes
        put :update, params: { friend: new_attributes, id: friend.id }
        expect(friend.reload.first_name).to eq(new_attributes[:first_name])
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested friend' do
      friend = Friend.create! valid_attributes
      expect do
        delete :destroy, params: { id: friend.id }
      end.to change(Friend, :count).by(-1)
    end
  end
end
