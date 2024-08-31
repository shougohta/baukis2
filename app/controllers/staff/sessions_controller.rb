class Staff::SessionsController < Staff::Base

  def new
    if current_staff_member
      redirect_to :staff_root
    else
      form
      render action: "new"
    end
  end

  def create
    form(params[:staff_login_form])

    if form.email.present?
      staff_member = StaffMember.find_by("LOWER(email) = ?", form.email.downcase)
    end

    if staff_authenticator(staff_member, form.password)
      if staff_member.suspended?
        flash.now.alert = "アカウントが停止されています。"
        render action: "new"
      else  
        session[:staff_member_id] = staff_member.id
        flash.notice = "ログインしました。"
        redirect_to :staff_root
      end
    else
      flash.now.alert = "メールアドレスまたはパスワードが正しくありません。"
      render action: "new"
    end
  end

  def destroy
    session.delete(:staff_member_id)
    flash.notice = "ログアウトしました。"
    redirect_to :staff_root
  end

  private

  def form(staff_login_form = nil)
    @form ||= Staff::LoginForm.new(staff_login_form)
  end

  def staff_authenticator(staff_member, password)
    @staff_authenticator ||= Staff::Authenticator.new(staff_member).authenticate(password)
  end
end
