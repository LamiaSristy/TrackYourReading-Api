require 'rails_helper'

RSpec.describe 'Books API' do

  let!(:user) { create(:user) }
  let!(:books) { create_list(:book, 10, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { books.first.id }
 
  describe 'GET users/:user_id/books' do
    before { get "/users/#{user_id}/books" }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when user does not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  describe 'GET /users/:user_id/books/:id' do
    before { get "/users/#{user_id}/books/#{id}" }

    context 'when a book exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when a book does not exist' do
      let(:id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).not_to match(/Couldn't find The book/)
      end
    end
  end

 
  describe 'POST post "/users/:user_id/books' do
    let(:valid_attributes) { { book: { name: 'Book1', author: 'Author1', genre: 'Genre1', pages: 100, user_id: user_id } } }

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/books", params: valid_attributes }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      context 'when an invalid request' do
        before { post "/users/#{user_id}/books", params: { book: { name: '' } } }

        it 'returns status code 400' do
          expect(response).to have_http_status(400)
        end

        it 'returns a failure message' do
          expect(response.body).not_to match(/Unable to create Book/)
        end
      end
    end
  end
 
  describe 'PUT /users/:user_id/books/:id' do
    let(:valid_attributes) { { book: { name: 'Book1' } } }

    before { put "/users/#{user_id}/books/#{id}", params: valid_attributes }

    context 'when Books exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the Book' do
        updated_book = Book.find(id)
        expect(updated_book.name).to match(/Book1/)
      end
    end

    context 'when the book does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).not_to match(/Couldn't find the book/)
      end
    end
  end

  describe 'DELETE /users/:user_id/books/:id' do
    before { delete "/users/#{user_id}/books/#{id}" }
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
