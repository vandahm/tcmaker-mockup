class IndexController < ApplicationController
  def index;end

  def blog_archive
    @posts = fake_posts
  end

  def blog_detail
    @post = fake_post
    @sidebar_posts = fake_posts(3)
  end

  protected

  def fake_post
    p = OpenStruct.new
    p.title = Faker::Hipster.sentence.chomp('.')
    p.author = Faker::StarTrek.character
    p.date = rand(2930).days.ago
    p.excerpt = Faker::Hipster.paragraphs(1).join(' ')
    p.body = '<p>' + Faker::Hipster.paragraphs(9, true).join('</p><p>') + '</p>'
    p
  end

  def fake_posts(count=7)
    posts = []
    count.times do
      posts << fake_post
    end
    posts.sort_by { |p| p.date }
  end
end
