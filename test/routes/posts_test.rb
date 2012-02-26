require 'test_helper'

class PostsTest < MiniTest::Unit::TestCase
  def setup
  end

  def test_posts
    routes = Routes.build do
      match "/posts/:id" => "posts#show", :as => "posts"
      match "/posts/:posts_id/comments/:id" => "comments#show", :as => "posts_comments"
    end

    assert_equal "/posts/1", routes.url_helpers.posts_path(:id => 1)
    assert_equal "/posts/1/comments/2", routes.url_helpers.posts_comments_path(:posts_id => 1, :id => 2)

    test_str = "/posts/1"
    route = routes.find_by_url(test_str)
    assert_equal test_str, route.build(:id => 1)

    host = "example.com"
    assert_equal "http://example.com/posts/1", routes.url_helpers.posts_url({:id => 1}, host)

  end
end
