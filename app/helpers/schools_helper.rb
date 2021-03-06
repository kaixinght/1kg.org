module SchoolsHelper
  def radio_choice(form, object)
    [[0,"否"], [1,"是"], [2, "未知"]].collect {|r| form.radio_button(object, r[0]) + r[1]}
  end
  
  def radio_value(value)
    result = %w(没有 有 未知)
    value.blank? ? "未知" : result[value]
  end
  
  def validate_for_human(school)
    if school.validated?
      if school.validator
        "#{school.validated_at.to_date}由#{link_to school.validator.login, user_url(school.validator)}验证"
      else
        "#{school.validated_at.to_date}通过验证"
      end
    else
      if school.validated_at.blank?
        "<span class=\"required\">学校信息未验证</span>"
      elsif school.validator
        "<span class=\"required\">#{school.validated_at.to_date}由#{link_to school.validator.login, user_url(school.validator)}取消验证</span>"
      elsif school.validated_at && !school.validator.blank?
        "<span class=\"required\">#{school.validated_at.to_date}取消验证</span>"
      end

    end
  end
  
  def edit_school_position_path(school)
    edit_school_path(school, :step => 'position')
  end
end