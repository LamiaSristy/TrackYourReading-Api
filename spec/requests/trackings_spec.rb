require 'rails_helper'

RSpec.describe 'Book API' do
  let!(:user) { create(:user) }
  let!(:book) { create(:book) }
  let!(:trackings) { create_list(:tracking, 10, book_id: book.id) }
  let(:user_id) { user.id }
  let(:book_id) { book.id }
  let(:id) { trackings.first.id }

  describe 'GET users/:user_id/books/:book_id/trackings' do
    before { get "/users/#{user_id}/books/#{book_id}/trackings" }

    context 'when the book exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when book does not exist' do
      let(:book_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).not_to match(/Couldn't find the Book/)
      end
    end
  end

  describe 'GET /users/:user_id/books/:book_id/trackings/:id' do
    before { get "/users/#{user_id}/books/#{book_id}/trackings/#{id}" }

    context 'when tracking exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context 'when tracking does not exist' do
      let(:id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Tracking/)
      end
    end
  end

  describe 'POST /users/:user_id/books/:book_id/trackings' do
    let(:valid_attributes) { { tracking: { date: '2014-09-23', temperature: 37, book_id: book_id } } }

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/books/#{book_id}/trackings", params: valid_attributes }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when an invalid request' do
      before { post "/users/#{user_id}/books/#{book_id}/trackings", params: { tracking: { temperature: 38 } } }

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end

      it 'returns a unable to create book message' do
        expect(response.body).to match(/Unable to create Date/)
      end
    end
  end

  describe 'PUT /users/:user_id/books/:book_id/trackings/:id' do
    let(:valid_attributes) { { tracking: { page_no: 38 } } }

    before { put "/users/#{user_id}/books/#{book_id}/trackings/#{id}", params: valid_attributes }

    context 'when tracking exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates tracking' do
        updated_tracking = Tracking.find(id)
        expect(updated_tracking.page_no).to match(38)
      end
    end

    context 'when the tracking does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Tracking/)
      end
    end
  end

  describe 'DELETE /users/:user_id/books/:book_id/trackings/:id' do
    before { delete "/users/#{user_id}/books/#{book_id}/trackings/#{id}" }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
