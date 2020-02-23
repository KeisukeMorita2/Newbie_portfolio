require 'rails_helper'

RSpec.describe 'お気に入り登録機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
  let!(:question_a) { FactoryBot.create(:question, title: '最初の問題', user: user_a) }

  context 'ユーザーBがログインしているとき' do
    let(:login_user) { user_b }

    before do
      visit new_session_path
      fill_in 'Eメール', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログイン'
      visit questions_path
    end

    it 'ユーザーAの問題をいいねする' do
      click_link '最初の問題'
      click_button 'いいねする'
      expect(page).to have_content 'いいね中'
    end

    it 'いいね中はいいねを解除できる' do
      click_link '最初の問題'
      click_button 'いいねする'
      click_button 'いいね中'
      expect(page).to have_content 'いいねする'
    end
  end

  context 'ユーザーがログインしていないとき' do
    before do
      visit questions_path
    end

    it 'いいねボタンは表示されない' do
      click_link '最初の問題'
      expect(page).not_to have_content 'いいねする'
    end
  end
end
