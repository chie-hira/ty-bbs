class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def show
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

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to posts_path
        else
            render :edit
        end
    end

    def destroy
        if @post.destroy
            redirect_to posts_path
        else
            render :index
        end
    end

    private
    def post_params
        # ストロングパラメーター
        # フォームから送られてきたデータのうち、許可されたデータだけを受け取る
        # この場合、titleとcontentだけを受け取る
        params.require(:post).permit(:title, :content)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
