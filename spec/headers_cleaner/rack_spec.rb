require 'spec_helper'
require 'rack'

RSpec.describe HeadersCleaner::Rack do

  let(:stack) do
    described_class.new(app)
  end

  let(:request) do
    Rack::MockRequest.new(stack)
  end

  context 'when keeping headers' do

    subject(:response) do
      request.get('/')
    end

    let(:app) do
      proc { [200,{'TO_KEEP' => 'KEEP ME !'},['Hello, world.']] }
    end

    it 'keeps header' do
      expect(response.headers['TO_KEEP']).to eq('KEEP ME !')
    end

  end

  context 'when deleting headers' do

    subject(:response) do
      request.get('/')
    end

    let(:app) do
      proc { [200, {'X-Runtime' => 'DELETE ME !'}, ['Hello World.']] }
    end

    it 'removes header' do
      expect(response.headers['TO_DELETE']).to eq(nil)
    end

  end

  context 'when is server header' do

    subject(:response) do
      request.get('/')
    end

    let(:app) do
      proc { [200, {'Server' => 'REPLACE ME !'}, ['Hello World.']] }
    end

    it 'removes header' do
      expect(response.headers['Server']).to eq('42')
    end

  end

end
