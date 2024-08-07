require_relative '../spec_helper'

RSpec.describe Mokkku::Generators::Builder do
  describe '.call' do
    it 'raises error when generator is unsupported' do
      expect {
        described_class.call(generator: 'unsupported', api_key: 'api_key', prompt: 'prompt')
      }.to raise_error(Mokkku::Generators::Builder::UnsupportedGenerator)
    end

    it 'returns Gpt generator' do
      expect(
        described_class.call(generator: 'gpt', api_key: 'api_key', prompt: 'prompt')
      ).to eq(Mokkku::Generators::Gpt)
    end

    it 'returns Claude generator' do
      expect(
        described_class.call(generator: 'claude', api_key: 'api_key', prompt: 'prompt')
      ).to eq(Mokkku::Generators::Claude)
    end

    it 'returns Gemini generator' do
      expect(
        described_class.call(generator: 'gemini', api_key: 'api_key', prompt: 'prompt')
      ).to eq(Mokkku::Generators::Gemini)
    end
  end
end
