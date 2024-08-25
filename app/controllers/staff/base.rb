class Staff::Base < ApplicationController
  
  private

  def current_staff_member
    if session[:staff_member_id]
      # 遅延初期化（メモ化？）
      @current_staff_member ||= StaffMember.find_by(id: session[:staff_member_id])
    end
  end

  # application_helperでも定義したのと同義
  # erbテンプレート内でも使えるようになる
  helper_method :current_staff_member
end