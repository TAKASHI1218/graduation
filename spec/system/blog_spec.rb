require 'rails_helper'

RSpec.describe 'blogs機能', type: :system do

  describe 'T o r i y u u - notice board' do
    context 'blogを作成した場合' do
      it '作成済みのblogが表示されること' do
        User.create!(name: 'test', email: 'aa@gmail.com', password: '61346134', password_confirmation: '61346134', admin: 'true')
        visit user_session_path
        fill_in 'メールアドレス', with: 'aa@gmail.com'
        fill_in 'パスワード', with: '61346134'
        click_button 'ログイン'
        visit blogs_path
        expect(page).to have_content 'T o r i y u u - notice board'
        click_on '投稿する'
        fill_in '題名', with: 'ああああ'
        fill_in '本文', with: 'いいいい'
        select 'とても満足です！', from: 'blog_status'
        click_button '投稿'
        expect(page).to have_content 'ああああ'
      end
    end
  end
  #
  describe 'T o r i y u u - notice board' do
    context 'blogを削除した場合' do
      it '作成済みのblogが削除されること' do
        User.create!(name: 'test', email: 'aa@gmail.com', password: '61346134', password_confirmation: '61346134', admin: 'true')
        visit user_session_path
        fill_in 'メールアドレス', with: 'aa@gmail.com'
        fill_in 'パスワード', with: '61346134'
        click_button 'ログイン'
        visit blogs_path
        expect(page).to have_content 'T o r i y u u - notice board'
        click_on '投稿'
        fill_in '題名', with: 'ああああ'
        fill_in '本文', with: 'いいいい'
        select 'とても満足です！', from: 'blog_status'
        click_button '投稿'
        expect(page).to have_content 'ああああ'
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content 'ああああ'
      end
    end
  end
  #
  describe 'T o r i y u u - notice board' do
    context 'blogを編集した場合' do
      it '作成済みのblogが編集されること' do
        User.create!(name: 'test', email: 'aa@gmail.com', password: '61346134', password_confirmation: '61346134', admin: 'true')
        visit user_session_path
        fill_in 'メールアドレス', with: 'aa@gmail.com'
        fill_in 'パスワード', with: '61346134'
        click_button 'ログイン'
        visit blogs_path
        expect(page).to have_content 'T o r i y u u - notice board'
        click_on '投稿する'
        fill_in '題名', with: 'ああああ'
        fill_in '本文', with: 'いいいい'
        select 'とても満足です！', from: 'blog_status'
        click_button '投稿'
        expect(page).to have_content 'ああああ'
        click_on '編集'
        fill_in '題名', with: 'たたたた'
        click_button '投稿'
        expect(page).to have_content 'たたたた'
        expect(page).not_to have_content 'ああああ'
      end
    end
  end
  #
  describe 'T o r i y u u - notice board' do
    context 'blogをご満足でソートした場合' do
      it 'ご満足度でソートされること' do
        User.create!(name: 'test', email: 'aa@gmail.com', password: '61346134', password_confirmation: '61346134', admin: 'true')
        visit user_session_path
        fill_in 'メールアドレス', with: 'aa@gmail.com'
        fill_in 'パスワード', with: '61346134'
        click_button 'ログイン'
        visit blogs_path
        click_on '投稿する'
        fill_in '題名', with: 'ゆゆゆゆ'
        fill_in '本文', with: 'いいいい'
        select 'とても満足です！', from: 'blog_status'
        click_button '投稿'
        click_on '投稿する'
        fill_in '題名', with: 'ああああ'
        fill_in '本文', with: 'いいいい'
        select '普通', from: 'blog_status'
        click_button '投稿'
        click_on '投稿する'
        fill_in '題名', with: 'ああああ'
        fill_in '本文', with: 'いいいい'
        select '少し不満。。', from: 'blog_status'
        click_button '投稿'
        click_on '投稿する'
        fill_in '題名', with: 'ああああ'
        fill_in '本文', with: 'いいいい'
        select '満足です！', from: 'blog_status'
        click_button '投稿'
        visit blogs_path
        blogs = all(".table")
        table_0 = blogs[0]
        click_on 'ご満足度でソートする'
        expect(table_0).to have_content 'ゆゆゆゆ'
      end
    end
  end
  #
  describe 'T o r i y u u - notice board' do
    context 'blogを最新順でソートした場合' do
      it '最新順でソートされること' do
        User.create!(name: 'test', email: 'aa@gmail.com', password: '61346134', password_confirmation: '61346134', admin: 'true')
        visit user_session_path
        fill_in 'メールアドレス', with: 'aa@gmail.com'
        fill_in 'パスワード', with: '61346134'
        click_button 'ログイン'
        visit blogs_path
        click_on '投稿する'
        fill_in '題名', with: 'aaaa'
        fill_in '本文', with: 'いいいい'
        select 'とても満足です！', from: 'blog_status'
        click_button '投稿'
        click_on '投稿する'
        fill_in '題名', with: 'bbbb'
        fill_in '本文', with: 'いいいい'
        select '不満です。。', from: 'blog_status'
        click_button '投稿'
        click_on '投稿する'
        fill_in '題名', with: 'cccc'
        fill_in '本文', with: 'いいいい'
        select '満足です！', from: 'blog_status'
        click_button '投稿'
        click_on '投稿する'
        fill_in '題名', with: 'zzzz'
        fill_in '本文', with: 'いいいい'
        select '普通', from: 'blog_status'
        click_button '投稿'
        visit blogs_path
        blogs = all(".table")
        table_0 = blogs[0]
        click_on 'ご満足度でソートする'
        expect(table_0).to have_content 'aaaa'
        blogs = all(".table")
        table_0 = blogs[0]
        click_on '最新順でソートする'
        expect(table_0).to have_content 'zzzz'
      end
    end
  end
  #
  describe 'T o r i y u u - notice board' do
    context 'blogをご来店日でソートした場合' do
      it 'ご来店日でソートされること' do
        User.create!(name: 'test', email: 'aa@gmail.com', password: '61346134', password_confirmation: '61346134', admin: 'true')
        visit user_session_path
        fill_in 'メールアドレス', with: 'aa@gmail.com'
        fill_in 'パスワード', with: '61346134'
        click_button 'ログイン'
        visit blogs_path
        click_on '投稿する'
        fill_in '題名', with: 'ご来店日1'
        fill_in '本文', with: 'aaaaaa'
        select '2019', from: 'blog_visit_date_1i'
        select '1月', from: 'blog_visit_date_2i'
        select '1', from: 'blog_visit_date_3i'
        select 'とても満足です！', from: 'blog_status'
        click_button '投稿'
        visit blogs_path
        click_on '投稿する'
        fill_in '題名', with: 'ご来店日2'
        fill_in '本文', with: 'bbbbb'
        select '2019', from: 'blog_visit_date_1i'
        select '2月', from: 'blog_visit_date_2i'
        select '1', from: 'blog_visit_date_3i'
        select '少し不満。。', from: 'blog_status'
        click_button '投稿'
        visit blogs_path
        click_on '投稿する'
        fill_in '題名', with: 'ご来店日3'
        fill_in '本文', with: 'ccccc'
        select '2019', from: 'blog_visit_date_1i'
        select '3月', from: 'blog_visit_date_2i'
        select '1', from: 'blog_visit_date_3i'
        select '満足です！', from: 'blog_status'
        click_button '投稿'
        visit blogs_path
        click_on '投稿する'
        fill_in '題名', with: 'ご来店日4'
        fill_in '本文', with: 'ddddd'
        select '2019', from: 'blog_visit_date_1i'
        select '4月', from: 'blog_visit_date_2i'
        select '1', from: 'blog_visit_date_3i'
        select '普通', from: 'blog_status'
        click_button '投稿'
        visit blogs_path
        blogs = all(".table")
        table_0 = blogs[0]
        click_on 'ご来店日でソートする'
        expect(table_0).to have_content 'ご来店日1'
      end
    end
  end

end
