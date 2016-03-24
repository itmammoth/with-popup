require 'rails_helper'

describe 'TestHelper', type: :controller do
  describe '#with_popup_reloading_path' do
    context 'when popup is going to be reloaded' do
      it 'returns reloading url' do
        session[:_with_popup] = '/path/to'
        expect(with_popup_reloading_path).to eql '/path/to'
      end
    end

    context 'when popup is closing' do
      it 'returns nil' do
        session[:_with_popup] = :close
        expect(with_popup_reloading_path).to be_nil
      end
    end
  end

  describe '#with_popup_is_closing?' do
    context 'when popup is going to be reloaded' do
      it 'returns false' do
        session[:_with_popup] = '/path/to'
        expect(with_popup_is_closing?).to be_falsy
      end
    end

    context 'when popup is closing' do
      it 'returns nil' do
        session[:_with_popup] = :close
        expect(with_popup_is_closing?).to be_truthy
      end
    end
  end
end