class CalendarsController < ApplicationController
    def index
    end

    def new
        @calendar = Calendar.new
    end

    def show
        @calendar = Calendar.find_by(id: params[:id])
        @blogs = Blog.all
        render "calendars/show"
    end

    def create
        calendar = Calendar.new(perfume_params)
        if calendar.save
            flash[:notice] = "診断が完了しました"
            redirect_to calendar_path(calendar.id)
        else
            redirect_to :action => "new"
        end
    end
  
  private
    def calendar_params
        params.require(:calender).permit(:question1, :question2, :question3, :question4)
    end
end

