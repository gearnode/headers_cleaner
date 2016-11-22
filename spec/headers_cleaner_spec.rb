require 'spec_helper'

RSpec.describe HeadersCleaner do

  subject(:gem) { described_class }

  it 'has a version number' do
    expect(HeadersCleaner::VERSION).not_to be nil
  end

  describe '.middleware' do

    subject(:middleware) { gem.middleware }

    it 'does return rack middleware class' do
      expect(middleware).to eq(HeadersCleaner::Rack)
    end

  end

end
