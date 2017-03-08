require 'test_helper'

class PostFlowTest < ActionDispatch::IntegrationTest
  test 'creates post' do
    get '/posts/new'
    assert_response :success
    assert_select 'input#post_title'
    assert_select 'textarea#post_body'

    post '/posts', params: { post: { title: 'test1', body: 'test2' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'h3', 'test1'
  end
end
