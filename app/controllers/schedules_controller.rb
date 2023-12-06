class SchedulesController < ApplicationController
    def index
        @schedules = Schedule.all
        @schedule = Schedule.new
        @schedule_count = Schedule.count
    end

    def new
        @schedule = Schedule.new
    end

    def create
        @schedule = Schedule.new(schedule_params)
        if @schedule.save
            flash[:notice] = "スケジュールを登録しました。"
            redirect_to schedules_path
        else
            flash.now[:alert] = "スケジュールを登録できません。もう一度試してください。"
            render :new
        end
    end

    def show
        @schedule = Schedule.find(params[:id])
    end
  
    def edit
        @schedule = Schedule.find(params[:id])
    end
  
    def update
        @schedule = Schedule.find(params[:id])
        if @schedule.update(schedule_params)
            flash[:notice] = "スケジュールを登録しました。"
            redirect_to schedules_path
        else
            flash.now[:alert] = "スケジュールを登録できません。もう一度試してください。"
            render :edit
        end
    end
  
    def destroy
        @schedule = Schedule.find(params[:id])
        @schedule.destroy
        flash[:notice] = "ユーザーを削除しました。"
        redirect_to :schedules
    end
 
    private
    def schedule_params
        params.require(:schedule).permit(
            :name, 
            :start_date, 
            :end_date,
            :is_all_day,
            :memo
        )
    end

end
