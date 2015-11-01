require 'rails_helper'

describe 'FormTagHelper', js: :true do
  before do
    visit '/'
    click_link 'FormTagHelper'
  end

  shared_examples_for 'closing_popup' do
    it 'closes popup and render new page' do
      expect(windows.size).to eql 1
      expect(page).to have_content("Can't be blank")
    end
  end

  shared_examples_for 'reloading_popup' do
    it 'reloads popup and redirect to done page' do
      expect(windows.size).to eql 2
      within_window windows.first do
        expect(page).to have_content('Done')
      end
      within_window windows.last do
        expect(page).to have_content('Reloaded!')
      end
    end
  end

  describe 'click submit_tag' do
    context 'when body is blank' do
      before do
        click_button 'submit_tag'
      end
      it_behaves_like 'closing_popup'
    end

    context 'when body is present' do
      before do
        fill_in 'post_body', with: 'test'
        click_button 'submit_tag'
      end
      it_behaves_like 'reloading_popup'
    end
  end

  describe 'click submit_tag (with popup_features)' do
    context 'when body is blank' do
      before do
        click_button 'submit_tag (with popup_features)'
      end
      it_behaves_like 'closing_popup'
    end

    context 'when body is present' do
      before do
        fill_in 'post_body', with: 'test'
        click_button 'submit_tag (with popup_features)'
      end
      it_behaves_like 'reloading_popup'
      # Not work...
      # it 'opens popup with features option' do
      #   within_window windows.last do
      #     expect(page.evaluate_script('window.innerWidth')).to eql 300
      #     expect(page.evaluate_script('window.innerHeight')).to eql 200
      #   end
      # end
    end
  end

  describe 'click submit_tag (with confirm)' do
    context 'when body is blank' do
      before do
        click_button 'submit_tag (with confirm)'
      end
      it_behaves_like 'closing_popup'
    end

    context 'when body is present' do
      before do
        fill_in 'post_body', with: 'test'
        click_button 'submit_tag (with confirm)'
      end
      it_behaves_like 'reloading_popup'
    end
  end

  describe 'click image' do
    context 'when body is blank' do
      before do
        find('input[alt="Submit"]').click
      end
      it_behaves_like 'closing_popup'
    end

    context 'when body is present' do
      before do
        fill_in 'post_body', with: 'test'
        find('input[alt="Submit"]').click
      end
      it_behaves_like 'reloading_popup'
    end
  end

  describe 'click button_tag' do
    context 'when body is blank' do
      before do
        click_button 'button_tag'
      end
      it_behaves_like 'closing_popup'
    end

    context 'when body is present' do
      before do
        fill_in 'post_body', with: 'test'
        click_button 'button_tag'
      end
      it_behaves_like 'reloading_popup'
    end
  end

  describe 'click button_to' do
    context 'when body is blank' do
      before do
        click_button 'button_to'
      end
      it_behaves_like 'closing_popup'
    end

    context 'when body is present' do
      before do
        fill_in 'post_body', with: 'test'
        click_button 'button_to'
      end
      it_behaves_like 'reloading_popup'
    end
  end

  describe 'click link_to' do
    before { click_link 'link_to' }
    it_behaves_like 'reloading_popup'
  end

  describe 'click link_to_if' do
    before { click_link 'link_to_if' }
    it_behaves_like 'reloading_popup'
  end

  describe 'click link_to_unless' do
    before { click_link 'link_to_unless' }
    it_behaves_like 'reloading_popup'
  end

  describe 'click link_to_unless_current' do
    before { click_link 'link_to_unless_current' }
    it_behaves_like 'reloading_popup'
  end
end