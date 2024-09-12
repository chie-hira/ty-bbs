class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    
    # メソッド名はviewのファイル名と同じにしないといけない
    def new
        @post = Post.new
    end

    # newとcreateはセットで使う
    def create
        # フォームから送られてきたデータを受け取ってインスタンス変数に代入
        @post = Post.new(post_params)
        
        # posts_pathはroutes.rbでresourcesを定義したときに自動的に生成される
        # posts_pathはposts#indexを指す
        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    private
    def post_params
        # ストロングパラメーター
        # フォームから送られてきたデータのうち、許可されたデータだけを受け取る
        # この場合、titleとcontentだけを受け取る
        params.require(:post).permit(:title, :content)
    end
end
