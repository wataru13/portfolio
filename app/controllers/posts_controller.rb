class PostsController < ApplicationController
    before_action :authenticate_user!


    # impressionist :actions => [:show], :unique => [:impressionable_id, :ip_address]
    def index
        if params[:search] == nil
            @posts= Post.all
        elsif params[:search] == ''
            @posts= Post.all
        else
            #部分検索
            @posts = Post.where("title LIKE ? ",'%' + params[:search] + '%').order(created_at: :desc)
        end
        @posts = @posts.order(created_at: :desc).page(params[:page]).per(6)

        @post = Post.new
        # @posts_latest3 = @posts.first(3)
        # @post3s = Post.limit(3).order(:created_at)
        # @pv_ranking = Post.find(Impression.group(:impressionable_id).order('count(impressionable_id) desc').limit(3).pluck(:impressionable_id))
        @rank_posts = Post.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.first(3)
    end

    def new
        @post = Post.new
    end

    def create
        post = Post.new(post_params)
        post.user_id = current_user.id
        if post.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @post = Post.find(params[:id])

        @comments = @post.comments
        @comment = Comment.new

        # @post = Post.find_by(id: params[:id])
        # @views = @post.impressions.size #PV数を取得
        # impressionist(@post, nil, unique: [:session_hash])
        # @pv_ranking = Post.find(Impression.group(:impressionable_id).order('count(impressionable_id) desc').limit(3).pluck(:impressionable_id))
    end
    
    def pv_ranking
        # @pv_ranking = Post.find(Impression.group(:impressionable_id).order('count(impressionable_id) desc').limit(3).pluck(:impressionable_id))
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        post = Post.find(params[:id])
        if post.update(post_params)
            redirect_to :action => "show", :id => post.id
        else
            redirect_to :action => "new"
        end
    end
    
    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to action: :index
    end

    def tv
        @tvs = Post.where(genre: "TV").order(created_at: :desc)
        @post = Post.new
    end
    def youtube
        @youtubes = Post.where(genre: "YouTube").order(created_at: :desc)
    end
    def netflix
        @netflixs = Post.where(genre: "Netflix").order(created_at: :desc)
    end
    def amazonprime
        @amazonprimes = Post.where(genre: "Amazon Prime").order(created_at: :desc)
        
        @post = Post.new
    end
    def hulu
        @hulus = Post.where(genre: "Hulu").order(created_at: :desc)
    end
    def dazn
        @dazns = Post.where(genre: "DAZN").order(created_at: :desc)
        
    end
    def other
        @others = Post.where(genre: "その他").order(created_at: :desc)
        #@pv_ranking = Post.find(Impression.group(:impressionable_id).order('count(impressionable_id) desc').limit(3).pluck(:impressionable_id))
    end

    private
    def post_params
        params.require(:post).permit(:body, :image, :title, :zoom, :time, :genre)
    end
end
