class SleepChecksController < ApplicationController
  def new
    @sleep_check = SleepCheck.new
  end

  def create
    # 各カテゴリごとの点数を計算
    rhythm_score   = params[:answers].values[0..2].map(&:to_i).sum   # 0〜2問目
    quality_score  = params[:answers].values[3..5].map(&:to_i).sum   # 3〜5問目
    quantity_score = params[:answers].values[6..8].map(&:to_i).sum   # 6〜8問目
    total_score    = rhythm_score + quality_score + quantity_score

    overall_quality = case total_score
                      when 0..3 then "良好"
                      when 4..6 then "やや不調"
                      else "要改善"
                      end

    
    @sleep_check = SleepCheck.create(
      user_id: current_user.id,
      rhythm: rhythm_score,
      quality: quality_score,
      quantity: quantity_score,
      score: total_score,
      overall_quality: overall_quality,
      note: advice_message(overall_quality)
    )

    redirect_to sleep_check_path(@sleep_check)
  end

  def show
    @sleep_check = SleepCheck.find(params[:id])
  end

  private

  def advice_message(quality)
    case quality
    when "良好" then "とてもいい状態です！この調子で続けましょう。"
    when "やや不調" then "睡眠リズムを少し整える意識をしてみましょう。"
    else "寝る時間を一定にすることから始めてみましょう。"
    end
  end
end

