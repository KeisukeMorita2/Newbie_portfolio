# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'フォロー機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }

  before do
    visit new_session_path
    fill_in 'Eメール', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログイン'
  end

  context 'ユーザーAがログインしているとき' do
    let(:login_user) { user_a }

    before do
      visit "/users/#{user_b.id}"
    end

    it 'ユーザーBをフォローするとフォロー中と表示される' do
      click_button 'フォローする'
      expect(page).to have_content 'フォロー中'
    end

    it 'フォローを解除するとフォローすると表示される' do
      click_button 'フォローする'
      click_button 'フォロー中'
      expect(page).to have_content 'フォローする'
    end
  end
end
