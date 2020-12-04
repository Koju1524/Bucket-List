require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        video: "Video"
      ),
      Post.create!(
        video: "Video"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", text: "Video".to_s, count: 2
  end
end
