require 'swagger_helper'

describe 'Events API' do

  path '/events' do

    post 'Creates a event' do
      tags 'Events'
      consumes 'application/json'
      parameter name: :event, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          start_date: { type: :string, format: :date },
          end_date: { type: :string, format: :date }
        },
        required: [ 'name', 'start_date', 'end_date' ]
      }

      response '201', 'event created' do
        let(:blog) { { title: 'foo', start_date: '2021-10-31', end_date: '2021-10-31' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { title: 'foo' } }
        run_test!
      end
    end
  end

  path '/events/{id}' do

    get 'Retrieves a event' do
      tags 'Events'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'blog found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string }
          },
          required: [ 'id', 'name' ]

        let(:id) { Event.create(name: 'foo').id }
        run_test!
      end

      response '404', 'blog not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
  
  path '/events' do

    get 'Retrieves a event' do
      tags 'Events'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'blog found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string }
          },
          required: [ 'id', 'name' ]

        let(:id) { Event.create(name: 'foo').id }
        run_test!
      end

      response '404', 'blog not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end