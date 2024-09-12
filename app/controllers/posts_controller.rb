class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    
    # メソッド名はviewのファイル名と同じにしないといけない
    def new
        @post = Post.new
    end
end
