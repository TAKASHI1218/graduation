require 'rails_helper'

RSpec.describe 'comments機能', type: :system do

  describe 'T o r i y u u - notice board' do
    context 'commentを作成した場合' do
      it '作成済みのcommentが表示されること' do
        User.create!(name: 'test', email: 'aa@gmail.com', password: '61346134', password_confirmation: '61346134', admin: 'true')
        visit user_session_path
        fill_in 'メールアドレス', with: 'aa@gmail.com'
        fill_in 'パスワード', with: '61346134'
        click_button 'ログイン'
        visit blogs_path
        click_on '投稿する'
        fill_in '題名', with: 'ああああ'
        fill_in '本文', with: 'いいいい'
        select '普通', from: 'blog_status'
        click_button '投稿'
        expect(page).to have_content 'ああああ'
        click_on '本文 & コメント'
        fill_in "comment[content]", with: 'ttttttt'
        click_button '投稿'
        expect(page).to have_content 'ttttttt'


      end
    end
  end

  describe 'T o r i y u u - notice board' do
    context 'commentを作成した場合' do
      it '作成済みのcommentが削除されること' do
        User.create!(name: 'test', email: 'aa@gmail.com', password: '61346134', password_confirmation: '61346134', admin: 'true')
        visit user_session_path
        fill_in 'メールアドレス', with: 'aa@gmail.com'
        fill_in 'パスワード', with: '61346134'
        click_button 'ログイン'
        visit blogs_path
        click_on '投稿する'
        fill_in '題名', with: 'ああああ'
        fill_in '本文', with: 'いいいい'
        select '普通', from: 'blog_status'
        click_button '投稿'
        expect(page).to have_content 'ああああ'
        click_on '本文 & コメント'
          fill_in "comment[content]", with: 'ttttttt'
        click_button '投稿'
        expect(page).to have_content 'ttttttt'
        click_on 'コメントを削除する'
        expect(page).not_to have_content 'ttttttt'
      end
    end
  end







end
